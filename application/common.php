<?php

use PhpOffice\PhpSpreadsheet\Cell\Coordinate;
use PhpOffice\PhpSpreadsheet\Cell\DataType;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Color;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Worksheet\PageSetup;
use service\DataService;
use service\NodeService;
use service\RandomService;
use think\Db;
use think\facade\Cache;
use think\facade\Log;


function isDebug()
{
    return config('app.app_debug');
}

/**
 * 日志记录
 * @param string|array $content 内容
 * @param string $type 日志类型
 * @param string $path 日志地址
 */
function logRecord($content, $type = 'info', $path = 'default')
{
    $path = 'log/' . $path;
    Log::init(['path' => $path]);
    if (is_array($content) || is_object($content)) {
        $content = json_encode($content);
    }
    Log::write($content, $type);
    Log::init();
}


function getCurrentMember()
{
    return session('member');
}

function setCurrentMember($data)
{

    $key = 'member:info:' . $data['code'];
    if (!$data) {
        Cache::rm($key);
    }else{
        Cache::set($key, $data);
    }
    return session('member', $data);
}

function getCurrentOrganizationCode()
{
    return session('currentOrganizationCode');
}

function setCurrentOrganizationCode($data)
{
    return session('currentOrganizationCode', $data);
}

function getCurrentOrganization()
{
    return session('organization');
}

function setCurrentOrganization($data)
{
    return session('organization', $data);
}

/**
 * 打印输出数据到文件
 * @param mixed $data 输出的数据
 * @param bool $force 强制替换
 * @param string|null $file
 */
function p($data, $force = false, $file = null)
{
    is_null($file) && $file = env('runtime_path') . date('Ymd') . '.txt';
    $str = (is_string($data) ? $data : ((is_array($data) || is_object($data)) ? print_r($data, true) : var_export($data, true))) . PHP_EOL;
    $force ? file_put_contents($file, $str) : file_put_contents($file, $str, FILE_APPEND);
}

/**
 * RBAC节点权限验证
 * @param string $node
 * @param string $moduleApp
 * @return bool
 */
function auth($node, $moduleApp = 'project')
{
    return NodeService::checkAuthNode($node, $moduleApp);
}

/**
 * 生成表唯一标记
 * @param string $tableName 表名
 * @param string $fieldName 字段名
 * @param int $len 长度
 * @return string
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function createUniqueCode($tableName, $fieldName = 'code', $len = 24)
{
    $code = RandomService::alnumLowercase($len);
    $has = Db::name($tableName)->where([$fieldName => $code])->field($fieldName)->find();
    if ($has) {
        return createUniqueCode($tableName, $fieldName, $len);
    }
    return $code;
}

/**
 * 设备或配置系统参数
 * @param string $name 参数名称
 * @param bool $value 默认是null为获取值，否则为更新
 * @return string|bool
 * @throws \think\Exception
 * @throws \think\exception\PDOException
 */
function sysconf($name, $value = null)
{
    static $config = [];
    if ($value !== null) {
        list($config, $data) = [[], ['name' => $name, 'value' => $value]];
        return DataService::save('SystemConfig', $data, 'name');
    }
    if (empty($config)) {
        $config = Db::name('SystemConfig')->column('name,value');
    }
    return isset($config[$name]) ? $config[$name] : '';
}

/**
 * 错误消息，一般用于向上抛出逻辑错误
 * @param $errno
 * @param string $message
 * @return array
 */
function error($errno, $message = '')
{
    return [
        'errno' => $errno,
        'msg' => $message,
    ];
}

/**
 * 判断是否含有错误消息
 * @param $data
 * @return bool
 */
function isError($data)
{
    if (empty($data) || !is_array($data) || !array_key_exists('errno', $data) || (array_key_exists('errno', $data) && $data['errno'] == 0)) {
        return false;
    } else {
        return true;
    }
}

/**
 * 是否开启消息推送
 * @return mixed
 */
function isOpenNoticePush()
{
    return config('config.notice_push');
}
/**
 * 是否开启钉钉消息推送
 * @return mixed
 */
function isOpenDingTalkNoticePush()
{
    return config('config.dingtalk_push');
}
/**
 * 是否开启任务邮件推送
 * @return mixed
 */
function isOpenMailNoticePush()
{
    return config('config.mail_push');
}

/**
 * 日期格式标准输出
 * @param string $datetime 输入日期
 * @param string $format 输出格式
 * @return false|string
 */
function format_datetime($datetime, $format = 'Y年m月d日 H:i:s')
{
    return date($format, strtotime($datetime));
}

/**
 * 当前时间
 * @return false|string
 */
function nowTime()
{
    return date('Y-m-d H:i:s', time());

}

// 判断文件或目录是否有写的权限
function is_really_writable($file)
{
    if (DIRECTORY_SEPARATOR == '/' AND @ ini_get("safe_mode") == FALSE) {
        return is_writable($file);
    }
    if (!is_file($file) OR ($fp = @fopen($file, "r+")) === FALSE) {
        return FALSE;
    }

    fclose($fp);
    return TRUE;
}

/**
 * 使用PHPEXECL导入
 *
 * @param string $file 文件地址
 * @param int $sheet 工作表sheet(传0则获取第一个sheet)
 * @param int $columnCnt 列数(传0则自动获取最大列)
 * @param array $options 操作选项
 *                          array mergeCells 合并单元格数组
 *                          array formula    公式数组
 *                          array format     单元格格式数组
 *
 * @return array
 * @throws Exception
 */
function importExcel(string $file = '', int $sheet = 0, int $columnCnt = 0, &$options = [])
{
    try {
        /* 转码 */
        $file = iconv("utf-8", "gb2312", $file);
        if (empty($file) OR !file_exists($file)) {
            throw new \Exception('文件不存在!');
        }

        /** @var Xlsx $objRead */
        $objRead = IOFactory::createReader('Xlsx');

        if (!$objRead->canRead($file)) {
            /** @var Xls $objRead */
            $objRead = IOFactory::createReader('Xls');

            if (!$objRead->canRead($file)) {
                throw new \Exception('只支持导入Excel文件！');
            }
        }

        /* 如果不需要获取特殊操作，则只读内容，可以大幅度提升读取Excel效率 */
        empty($options) && $objRead->setReadDataOnly(true);
        /* 建立excel对象 */
        $obj = $objRead->load($file);
        /* 获取指定的sheet表 */
        $currSheet = $obj->getSheet($sheet);

        if (isset($options['mergeCells'])) {
            /* 读取合并行列 */
            $options['mergeCells'] = $currSheet->getMergeCells();
        }

        if (0 == $columnCnt) {
            /* 取得最大的列号 */
            $columnH = $currSheet->getHighestColumn();
            /* 兼容原逻辑，循环时使用的是小于等于 */
            $columnCnt = Coordinate::columnIndexFromString($columnH);
        }

        /* 获取总行数 */
        $rowCnt = $currSheet->getHighestRow();
        $data = [];

        /* 读取内容 */
        for ($_row = 1; $_row <= $rowCnt; $_row++) {
            $isNull = true;

            for ($_column = 1; $_column <= $columnCnt; $_column++) {
                $cellName = Coordinate::stringFromColumnIndex($_column);
                $cellId = $cellName . $_row;
                $cell = $currSheet->getCell($cellId);

                if (isset($options['format'])) {
                    /* 获取格式 */
                    $format = $cell->getStyle()->getNumberFormat()->getFormatCode();
                    /* 记录格式 */
                    $options['format'][$_row][$cellName] = $format;
                }

                if (isset($options['formula'])) {
                    /* 获取公式，公式均为=号开头数据 */
                    $formula = $currSheet->getCell($cellId)->getValue();

                    if (0 === strpos($formula, '=')) {
                        $options['formula'][$cellName . $_row] = $formula;
                    }
                }

                if (isset($format) && 'm/d/yyyy' == $format) {
                    /* 日期格式翻转处理 */
                    $cell->getStyle()->getNumberFormat()->setFormatCode('yyyy/mm/dd');
                }

                $data[$_row][$cellName] = trim($currSheet->getCell($cellId)->getFormattedValue());

                if (!empty($data[$_row][$cellName])) {
                    $isNull = false;
                }
            }

            /* 判断是否整行数据为空，是的话删除该行数据 */
            if ($isNull) {
                unset($data[$_row]);
            }
        }

        return $data;
    } catch (\Exception $e) {
        throw $e;
    }
}

/**
 * Excel导出，TODO 可继续优化
 *
 * @param array $datas 导出数据，格式['A1' => 'XXXX公司报表', 'B1' => '序号']
 * @param string $fileName 导出文件名称
 * @param array $options 操作选项，例如：
 *                           bool   print       设置打印格式
 *                           string freezePane  锁定行数，例如表头为第一行，则锁定表头输入A2
 *                           array  setARGB     设置背景色，例如['A1', 'C1']
 *                           array  setWidth    设置宽度，例如['A' => 30, 'C' => 20]
 *                           bool   setBorder   设置单元格边框
 *                           array  mergeCells  设置合并单元格，例如['A1:J1' => 'A1:J1']
 *                           array  formula     设置公式，例如['F2' => '=IF(D2>0,E42/D2,0)']
 *                           array  format      设置格式，整列设置，例如['A' => 'General']
 *                           array  alignCenter 设置居中样式，例如['A1', 'A2']
 *                           array  bold        设置加粗样式，例如['A1', 'A2']
 *                           string savePath    保存路径，设置后则文件保存到服务器，不通过浏览器下载
 * @return bool
 */
function exportExcel(array $datas, string $fileName = '', array $options = []): bool
{
    try {
        if (empty($datas)) {
            return false;
        }

        set_time_limit(0);
        /** @var Spreadsheet $objSpreadsheet */
        $objSpreadsheet = app(Spreadsheet::class);
        /* 设置默认文字居左，上下居中 */
        $styleArray = [
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_LEFT,
                'vertical' => Alignment::VERTICAL_CENTER,
            ],
        ];
        $objSpreadsheet->getDefaultStyle()->applyFromArray($styleArray);
        /* 设置Excel Sheet */
        $activeSheet = $objSpreadsheet->setActiveSheetIndex(0);

        /* 打印设置 */
        if (isset($options['print']) && $options['print']) {
            /* 设置打印为A4效果 */
            $activeSheet->getPageSetup()->setPaperSize(PageSetup:: PAPERSIZE_A4);
            /* 设置打印时边距 */
            $pValue = 1 / 2.54;
            $activeSheet->getPageMargins()->setTop($pValue / 2);
            $activeSheet->getPageMargins()->setBottom($pValue * 2);
            $activeSheet->getPageMargins()->setLeft($pValue / 2);
            $activeSheet->getPageMargins()->setRight($pValue / 2);
        }

        /* 行数据处理 */
        foreach ($datas as $sKey => $sItem) {
            /* 默认文本格式 */
            $pDataType = DataType::TYPE_STRING;

            /* 设置单元格格式 */
            if (isset($options['format']) && !empty($options['format'])) {
                $colRow = Coordinate::coordinateFromString($sKey);

                /* 存在该列格式并且有特殊格式 */
                if (isset($options['format'][$colRow[0]]) &&
                    NumberFormat::FORMAT_GENERAL != $options['format'][$colRow[0]]) {
                    $activeSheet->getStyle($sKey)->getNumberFormat()
                        ->setFormatCode($options['format'][$colRow[0]]);

                    if (false !== strpos($options['format'][$colRow[0]], '0.00') &&
                        is_numeric(str_replace(['￥', ','], '', $sItem))) {
                        /* 数字格式转换为数字单元格 */
                        $pDataType = DataType::TYPE_NUMERIC;
                        $sItem = str_replace(['￥', ','], '', $sItem);
                    }
                } elseif (is_int($sItem)) {
                    $pDataType = DataType::TYPE_NUMERIC;
                }
            }

            $activeSheet->setCellValueExplicit($sKey, $sItem, $pDataType);

            /* 存在:形式的合并行列，列入A1:B2，则对应合并 */
            if (false !== strstr($sKey, ":")) {
                $options['mergeCells'][$sKey] = $sKey;
            }
        }

        unset($datas);

        /* 设置锁定行 */
        if (isset($options['freezePane']) && !empty($options['freezePane'])) {
            $activeSheet->freezePane($options['freezePane']);
            unset($options['freezePane']);
        }

        /* 设置宽度 */
        if (isset($options['setWidth']) && !empty($options['setWidth'])) {
            foreach ($options['setWidth'] as $swKey => $swItem) {
                $activeSheet->getColumnDimension($swKey)->setWidth($swItem);
            }

            unset($options['setWidth']);
        }

        /* 设置背景色 */
        if (isset($options['setARGB']) && !empty($options['setARGB'])) {
            foreach ($options['setARGB'] as $sItem) {
                $activeSheet->getStyle($sItem)
                    ->getFill()->setFillType(Fill::FILL_SOLID)
                    ->getStartColor()->setARGB(Color::COLOR_YELLOW);
            }

            unset($options['setARGB']);
        }

        /* 设置公式 */
        if (isset($options['formula']) && !empty($options['formula'])) {
            foreach ($options['formula'] as $fKey => $fItem) {
                $activeSheet->setCellValue($fKey, $fItem);
            }

            unset($options['formula']);
        }

        /* 合并行列处理 */
        if (isset($options['mergeCells']) && !empty($options['mergeCells'])) {
            $activeSheet->setMergeCells($options['mergeCells']);
            unset($options['mergeCells']);
        }

        /* 设置居中 */
        if (isset($options['alignCenter']) && !empty($options['alignCenter'])) {
            $styleArray = [
                'alignment' => [
                    'horizontal' => Alignment::HORIZONTAL_CENTER,
                    'vertical' => Alignment::VERTICAL_CENTER,
                ],
            ];

            foreach ($options['alignCenter'] as $acItem) {
                $activeSheet->getStyle($acItem)->applyFromArray($styleArray);
            }

            unset($options['alignCenter']);
        }

        /* 设置加粗 */
        if (isset($options['bold']) && !empty($options['bold'])) {
            foreach ($options['bold'] as $bItem) {
                $activeSheet->getStyle($bItem)->getFont()->setBold(true);
            }

            unset($options['bold']);
        }

        /* 设置单元格边框，整个表格设置即可，必须在数据填充后才可以获取到最大行列 */
        if (isset($options['setBorder']) && $options['setBorder']) {
            $border = [
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => Border::BORDER_THIN, // 设置border样式
                        'color' => ['argb' => 'FF000000'], // 设置border颜色
                    ],
                ],
            ];
            $setBorder = 'A1:' . $activeSheet->getHighestColumn() . $activeSheet->getHighestRow();
            $activeSheet->getStyle($setBorder)->applyFromArray($border);
            unset($options['setBorder']);
        }

        $fileName = !empty($fileName) ? $fileName : (date('YmdHis') . '.xlsx');

        if (!isset($options['savePath'])) {
            /* 直接导出Excel，无需保存到本地，输出07Excel文件 */
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header(
                "Content-Disposition:attachment;filename=" . iconv(
                    "utf-8", "GB2312//TRANSLIT", $fileName
                )
            );
            header('Cache-Control: max-age=0');//禁止缓存
            $savePath = 'php://output';
        } else {
            $savePath = $options['savePath'];
        }

        ob_clean();
        ob_start();
        $objWriter = IOFactory::createWriter($objSpreadsheet, 'Xlsx');
        $objWriter->save($savePath);
        /* 释放内存 */
        $objSpreadsheet->disconnectWorksheets();
        unset($objSpreadsheet);
        ob_end_flush();

        return true;
    } catch (Exception $e) {
        return false;
    }
}

/**
 * UTF8字符串加密
 * @param string $string
 * @return string
 */
function encode($string)
{
    list($chars, $length) = ['', strlen($string = iconv('utf-8', 'gbk', $string))];
    for ($i = 0; $i < $length; $i++) {
        $chars .= str_pad(base_convert(ord($string[$i]), 10, 36), 2, 0, 0);
    }
    return $chars;
}

/**
 * UTF8字符串解密
 * @param string $string
 * @return string
 */
function decode($string)
{
    $chars = '';
    foreach (str_split($string, 2) as $char) {
        $chars .= chr(intval(base_convert($char, 36, 10)));
    }
    return @iconv('gbk', 'utf-8', $chars);
}

/**
 * 获取锁
 * @param String $key 锁标识
 * @param Int $expire 锁过期时间
 * @return Boolean
 */
function lock($key = '', $expire = 5)
{
    $is_lock = Cache::store('redis')->get($key);
    //不能获取锁
    if (!$is_lock) {
        Cache::store('redis')->set($key, time() + $expire);
    }

    return $is_lock ? true : false;
}

/**
 * 释放锁
 * @param String $key 锁标识
 * @return Boolean
 */
function unlock($key = '')
{
    return Cache::store('redis')->rm($key);
}

/**
 * 下载远程文件到本地
 * @param string $url 远程图片地址
 * @return string
 */
function local_image($url)
{
    return \service\FileService::download($url)['url'];
}

/**
 * 提取base64
 * @param $base64_url
 * @return array
 */
function decodeFile($base64_url)
{
    preg_match('/^data:image\/(\w+);base64/', $base64_url, $out);

    $type = $out[1];
    $type_param = 'data:image/' . $type . ';base64,';
    $fileStream = str_replace($type_param, '', $base64_url);
    $fileStream = base64_decode($fileStream);

    return array(
        'type' => $type,
        'fileStream' => $fileStream
    );

}

//不同环境下获取真实的IP
function get_ip()
{
    //判断服务器是否允许$_SERVER
    if (isset($_SERVER)) {
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $realip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $realip = $_SERVER['HTTP_CLIENT_IP'];
        } else {
            $realip = $_SERVER['REMOTE_ADDR'];
        }
    } else {
        //不允许就使用getenv获取
        if (getenv("HTTP_X_FORWARDED_FOR")) {
            $realip = getenv("HTTP_X_FORWARDED_FOR");
        } elseif (getenv("HTTP_CLIENT_IP")) {
            $realip = getenv("HTTP_CLIENT_IP");
        } else {
            $realip = getenv("REMOTE_ADDR");
        }
    }

    return $realip;
}


/**
 * DES 加密
 * @param $dat 需要加密的字符串
 * @param $key 加密密钥
 * @return string
 */
function javaDesEncrypt($dat, $key)
{
    /*$block = mcrypt_get_block_size(MCRYPT_DES, MCRYPT_MODE_ECB);
    $len = strlen($dat);
    $padding = $block - ($len % $block);
    $dat .= str_repeat(chr($padding),$padding);
    return bin2hex(mcrypt_encrypt(MCRYPT_DES, $key, $dat, MCRYPT_MODE_ECB));*/

    return bin2hex(openssl_encrypt($dat, 'des-ecb', $key, OPENSSL_RAW_DATA));
}

/**
 * DES 解密
 * @param $dat 需要解密的字符串
 * @param $key 加密密钥
 * @return bool|string
 */
function javaDesDecrypt($dat, $key)
{
    /*$str = hex2bin($dat);
    $str = mcrypt_decrypt(MCRYPT_DES, $key, $str, MCRYPT_MODE_ECB);
    $pad = ord($str[($len = strlen($str)) - 1]);
    return substr($str, 0, strlen($str) - $pad);*/

    $str = hex2bin($dat);
    return openssl_decrypt($str, 'des-ecb', $key, OPENSSL_RAW_DATA);
}

