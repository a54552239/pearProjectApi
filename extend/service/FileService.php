<?php


namespace service;

use Exception;
use OSS\Core\OssException;
use OSS\OssClient;
use Qiniu\Auth;
use Qiniu\Storage\BucketManager;
use Qiniu\Storage\UploadManager;
use think\facade\Log;
use think\File;

/**
 * 系统文件服务
 * Class FileService
 * @package service
 * @author Vilson
 */
class FileService
{

    /**
     * 根据文件后缀获取文件MINE
     * @param array $ext 文件后缀
     * @param array $mine 文件后缀MINE信息
     * @return string
     */
    public static function getFileMine($ext, $mine = [])
    {
        $mines = self::getMines();
        foreach (is_string($ext) ? explode(',', $ext) : $ext as $e) {
            $mine[] = isset($mines[strtolower($e)]) ? $mines[strtolower($e)] : 'application/octet-stream';
        }
        return join(',', array_unique($mine));
    }

    /**
     * 获取所有文件扩展的mine
     * @return mixed
     */
    public static function getMines()
    {
        $mines = cache('all_ext_mine');
        if (empty($mines)) {
            $content = file_get_contents('http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types');
            preg_match_all('#^([^\s]{2,}?)\s+(.+?)$#ism', $content, $matches, PREG_SET_ORDER);
            foreach ($matches as $match) {
                foreach (explode(" ", $match[2]) as $ext) {
                    $mines[$ext] = $match[1];
                }
            }
            cache('all_ext_mine', $mines);
        }
        return $mines;
    }

    /**
     * 获取当前文件前缀设置
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function getFilePrefix()
    {
        switch (empty($storage) ? sysconf('storage_type') : $storage) {
            case 'local':
                return self::getBaseUriLocal();
            case 'qiniu':
                return self::getBaseUriQiniu();
            case 'oss':
                return self::getBaseUriOss();
        }
        throw new \think\Exception('未设置存储方式，无法获取到文件对应URL地址');
    }

    /**
     * 获取文件当前URL地址
     * @param string $filename 文件HASH名称
     * @param string|null $storage 文件存储引擎
     * @return bool|string
     * @throws OssException
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function getFileUrl($filename, $storage = null)
    {
        if (self::hasFile($filename, $storage) === false) {
            return false;
        }
        switch (empty($storage) ? sysconf('storage_type') : $storage) {
            case 'local':
                return self::getBaseUriLocal() . $filename;
            case 'qiniu':
                return self::getBaseUriQiniu() . $filename;
            case 'oss':
                return self::getBaseUriOss() . $filename;
        }
        throw new \think\Exception('未设置存储方式，无法获取到文件对应URL地址');
    }

    /**
     * 根据配置获取到本地上传的目标地址
     * @return string
     */
    public static function getUploadLocalUrl()
    {
        return url('@admin/plugs/upload');
    }

    /**
     * 根据配置获取到七牛云文件上传目标地址
     * @param bool $isClient
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function getUploadQiniuUrl($isClient = true)
    {
        $region = sysconf('storage_qiniu_region');
        $isHttps = !!sysconf('storage_qiniu_is_https');
        switch ($region) {
            case '华东':
                if ($isHttps) {
                    return $isClient ? 'https://upload.qiniup.com' : 'https://upload.qiniup.com';
                }
                return $isClient ? 'http://upload.qiniup.com' : 'http://upload.qiniup.com';
            case '华北':
                if ($isHttps) {
                    return $isClient ? 'https://upload-z1.qiniup.com' : 'https://up-z1.qiniup.com';
                }
                return $isClient ? 'http://upload-z1.qiniup.com' : 'http://up-z1.qiniup.com';
            case '北美':
                if ($isHttps) {
                    return $isClient ? 'https://upload-na0.qiniup.com' : 'https://up-na0.qiniup.com';
                }
                return $isClient ? 'http://upload-na0.qiniup.com' : 'http://up-na0.qiniup.com';
            case '华南':
                if ($isHttps) {
                    return $isClient ? 'https://upload-z2.qiniup.com' : 'https://up-z2.qiniup.com';
                }
                return $isClient ? 'http://upload-z2.qiniup.com' : 'http://up-z2.qiniup.com';
            default:
                throw new \think\Exception('未配置七牛云存储区域');
        }
    }

    /**
     * 获取AliOSS上传地址
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function getUploadOssUrl()
    {
        $protocol = request()->isSsl() ? 'https' : 'http';
        return "{$protocol}://" . sysconf('storage_oss_domain');
    }

    /**
     * 获取服务器URL前缀
     * @return string
     */
    public static function getBaseUriLocal()
    {
        $appRoot = request()->root(true);  // 去掉参数 true 将获得相对地址
        $uriRoot = preg_match('/\.php$/', $appRoot) ? dirname($appRoot) : $appRoot;
        $uriRoot = in_array($uriRoot, ['/', '\\']) ? '' : $uriRoot;
        return "{$uriRoot}/";
    }

    /**
     * 获取七牛云URL前缀
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function getBaseUriQiniu()
    {
        switch (strtolower(sysconf('storage_qiniu_is_https'))) {
            case 'https':
                return 'https://' . sysconf('storage_qiniu_domain') . '/';
            case 'http':
                return 'http://' . sysconf('storage_qiniu_domain') . '/';
            case 'auto':
                return '//' . sysconf('storage_qiniu_domain') . '/';
            default:
                throw new \think\Exception('未设置七牛云文件地址协议');
        }
    }

    /**
     * 获取阿里云对象存储URL前缀
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function getBaseUriOss()
    {
        switch (strtolower(sysconf('storage_oss_is_https'))) {
            case 'https':
                return 'https://' . sysconf('storage_oss_domain') . '/';
            case 'http':
                return 'http://' . sysconf('storage_oss_domain') . '/';
            case 'auto':
                return '//' . sysconf('storage_oss_domain') . '/';
            default:
                throw new \think\Exception('未设置阿里云文件地址协议');
        }
    }

    /**
     * 获取文件相对名称
     * @param string $local_url 文件标识
     * @param string $ext 文件后缀
     * @param string $pre 文件前缀（若有值需要以/结尾）
     * @return string
     */
    public static function getFileName($local_url, $ext = '', $pre = '')
    {
        empty($ext) && $ext = strtolower(pathinfo($local_url, 4));
        return $pre . join('/', str_split(md5($local_url), 16)) . '.' . ($ext ? $ext : 'tmp');
    }

    public static function removeSuffix($fileName)
    {
        return basename($fileName, "." . substr(strrchr($fileName, '.'), 1));
    }

    /**
     * 检查文件是否已经存在
     * @param string $filename
     * @param string|null $storage
     * @return bool
     * @throws OssException
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function hasFile($filename, $storage = null)
    {
        switch (empty($storage) ? sysconf('storage_type') : $storage) {
            case 'local':
                return file_exists(env('root_path') . $filename);
            case 'qiniu':
                $auth = new Auth(sysconf('storage_qiniu_access_key'), sysconf('storage_qiniu_secret_key'));
                $bucketMgr = new BucketManager($auth);
                list($ret, $err) = $bucketMgr->stat(sysconf('storage_qiniu_bucket'), $filename);
                return $err === null;
            case 'oss':
                $ossClient = new OssClient(sysconf('storage_oss_keyid'), sysconf('storage_oss_secret'), self::getBaseUriOss(), true);
                return $ossClient->doesObjectExist(sysconf('storage_oss_bucket'), $filename);
        }
        return false;
    }

    /**
     * 根据Key读取文件内容
     * @param string $filename
     * @param string|null $storage
     * @return string|null
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * @throws OssException
     */
    public static function readFile($filename, $storage = null)
    {
        switch (empty($storage) ? sysconf('storage_type') : $storage) {
            case 'local':
                $file = env('root_path') . config('upload.base_path') . $filename;
                return file_exists($file) ? file_get_contents($file) : '';
            case 'qiniu':
                $auth = new Auth(sysconf('storage_qiniu_access_key'), sysconf('storage_qiniu_secret_key'));
                return file_get_contents($auth->privateDownloadUrl(self::getBaseUriQiniu() . $filename));
            case 'oss':
                $ossClient = new OssClient(sysconf('storage_oss_keyid'), sysconf('storage_oss_secret'), self::getBaseUriOss(), true);
                return $ossClient->getObject(sysconf('storage_oss_bucket'), $filename);
            default:
                throw new \think\Exception('未配置读取文件的存储方法');
        }
    }

    /**
     * 根据当前配置存储文件
     * @param string $filename
     * @param string $content
     * @param string|null $file_storage
     * @return array|false
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function save($filename, $content, $file_storage = null)
    {
        $type = empty($file_storage) ? sysconf('storage_type') : $file_storage;
        if (!method_exists(__CLASS__, $type)) {
            Log::error("保存存储失败，调用{$type}存储引擎不存在！");
            return false;
        }
        return self::$type($filename, $content);
    }

    /**
     * 文件储存在本地
     * @param string $filename
     * @param string $content
     * @return array|null
     */
    public static function local($filename, $content, $append = false)
    {
        try {
            $realfile = env('root_path') . $filename;
            !file_exists(dirname($realfile)) && mkdir(dirname($realfile), 0755, true);
            if (file_put_contents($realfile, $content, $append ? FILE_APPEND : 0)) {
                $url = pathinfo(request()->baseFile(true), PATHINFO_DIRNAME) . '/' . $filename;
                return ['file' => $realfile, 'hash' => md5_file($realfile), 'key' => "{$filename}", 'url' => $url];
            }
        } catch (Exception $err) {
            Log::error('本地文件存储失败, ' . $err->getMessage());
        }
        return null;
    }

    /**
     * 七牛云存储
     * @param string $filename
     * @param string $content
     * @return array|null
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function qiniu($filename, $content, $append = false)
    {
        $auth = new Auth(sysconf('storage_qiniu_access_key'), sysconf('storage_qiniu_secret_key'));
        $token = $auth->uploadToken(sysconf('storage_qiniu_bucket'));
        $uploadMgr = new UploadManager();
        list($result, $err) = $uploadMgr->put($token, $filename, $content);
        if ($err !== null) {
            Log::error('七牛云文件上传失败, ' . $err->getMessage());
            return null;
        }
        $result['file'] = $filename;
        $result['url'] = self::getBaseUriQiniu() . $filename;
        return $result;
    }

    /**
     * 阿里云OSS
     * @param string $filename
     * @param string $content
     * @return array|null
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public static function oss($filename, $content, $append = false)
    {
        try {
            $endpoint = 'http://' . sysconf('storage_oss_domain');
            $ossClient = new OssClient(sysconf('storage_oss_keyid'), sysconf('storage_oss_secret'), $endpoint, true);
            $result = $ossClient->putObject(sysconf('storage_oss_bucket'), $filename, $content);
            $baseUrl = explode('://', $result['oss-request-url'])[1];
            if (strtolower(sysconf('storage_oss_is_https')) === 'http') {
                $site_url = "http://{$baseUrl}";
            } elseif (strtolower(sysconf('storage_oss_is_https')) === 'https') {
                $site_url = "https://{$baseUrl}";
            } else {
                $site_url = "//{$baseUrl}";
            }
            return ['file' => $filename, 'hash' => $result['content-md5'], 'key' => $filename, 'url' => $site_url];
        } catch (OssException $err) {
            Log::error('阿里云OSS文件上传失败, ' . $err->getMessage());
        }
        return null;
    }

    /**
     * 下载文件到本地
     * @param string $url 文件URL地址
     * @param bool $isForce 是否强制重新下载文件
     * @return array
     */
    public static function download($url, $isForce = false)
    {
        try {
            $filename = self::getFileName($url, '', 'download/');
            if (false === $isForce && ($siteUrl = self::getFileUrl($filename, 'local'))) {
                $realfile = env('root_path') . config('upload.base_path') . $filename;
                return ['file' => $realfile, 'hash' => md5_file($realfile), 'key' => config('upload.base_path') . "{$filename}", 'url' => $siteUrl];
            }
            return self::local($filename, file_get_contents($url));
        } catch (\Exception $e) {
            Log::error("FileService 文件下载失败 [ {$url} ] " . $e->getMessage());
        }
        return ['url' => $url];
    }

}
