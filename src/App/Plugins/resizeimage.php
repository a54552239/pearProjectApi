<?php
namespace App\Plugins;
/**
 * 图片缩略
 *
 */
class ResizeImage
{
    /**
     * 在upload中图片保存的文件路径，如：shop/store/goods/1/
     */
    private $dir_path;

    private $config;
    /**
     * 图片类型
     */
    private $type;
    /**
     * 实际图片宽度
     */
    private $width;
    /**
     * 实际图片高度
     */
    private $height;
    /**
     * 改变后的图片宽度
     */
    private $resize_width;
    /**
     * 改变后的图片高度
     */
    private $resize_height;
    /**
     * 是否截图
     */
    private $cut = 0;
    /**
     * 来源图片地址
     */
    private $srcimg;
    /**
     * 目标图片地址
     */
    private $dstimg;
    /**
     * 目标图片相对地址
     */
    public $relative_dstimg;
    /**
     * 临时图片
     */
    private $im;
    /**
     * 缩略图文件名扩展
     */
    private $small_ext = "_small.";
    /**
     * 缩略图宽高比例
     *
     * @var unknown_type
     */
    private $scale = 0;
    /**
     * 是否允许填充空白
     *
     * @var unknown_type
     */
    private $filling = true;

    private $ifremove = true;

    /**
     * 构造函数
     *
     * 使用示例
     * newImg('图片', '宽度', '高度','缩略图宽高比','缩略图后缀名')
     * $resizeImage    = new ResizeImage();
     * $resizeImage->newImg($save_path.DS.$this->file_name,$thumb_width,$thumb_height,$scale,$thumb_ext[$i].'.',$save_path);
     *
     * @param string $img 原图路径
     * @param int $wid 缩略图宽度
     * @param int $hei 缩略图高度
     * @param $scale 缩略图宽高比 >0说明宽高相等，值为宽的值，=0为宽高不等
     * @param string $small_ext 缩略图文件名后缀
     * @param string $dst_img 生成图片地址
     * @param $filling 是否允许填充空白，默认允许
     * @return array $rs_row 返回数组形式的查询结果
     */
    public function newImg($img, $wid, $hei, $scale, $small_ext = "_small.", $dst_img = '', $filling = true)
    {
        $this->config['impath'] = C('thumb.impath');
        $this->config['thumb_type'] = C('thumb.cut_type');
        $this->config['thumb_quality'] = 100;
// 		$this->config['thumb_quality'] = (C('thumb_quality') ? C('thumb_quality') : 100);
        $this->srcimg = $img;
        $this->scale = $scale;
        //暂时决定缩略图为正方形并且目标宽高小于200的才会补白，图片大消耗资源
        if ($scale != 360) {
            $this->filling = false;
        } else {
            $this->filling = $filling;
        }
        $this->resize_width = round($wid);
        $this->resize_height = round($hei);
        $this->small_ext = $small_ext;
        $this->dstimg = $dst_img;
        $this->type = substr(strrchr($this->srcimg, "."), 1);
        if ($this->config['thumb_type'] == 'im') {
            $this->thumb_im();
        } else {
            $this->thumb_gd();
        }
    }

    /**
     * @param $path 设置upload中图片保存的文件路径
     */
    public function setDirPath($path)
    {
        $this->dir_path = $path;
    }

    private function thumb_gd()
    {
        $this->initi_img();
        if (!is_resource($this->im)) return false;
        $this->dst_img();
        $this->width = imagesx($this->im);
        $this->height = imagesy($this->im);
        /**
         * 改变后的图象的比例
         */
        $resize_ratio = ($this->resize_width) / ($this->resize_height);
        /**
         * 实际图象的比例
         */
        $ratio = ($this->width) / ($this->height);

        if ($this->scale > 0 && $this->filling) {
            $wh = $this->scale;
//			if ($this->resize_height > $this->resize_width){
//				$wh = $this->resize_height;
//			}else{
//				$wh = $this->resize_width;
//			}
            if ($ratio > 1) {
                $dst_y = ($wh - $wh / $ratio) / 2;
                $dst_x = 0;
            } else {
                $dst_x = ($wh - $wh * $ratio) / 2;
                $dst_y = 0;
            }
            //等比缩图(宽高最大为$wh)
            if ($resize_ratio > 1) {
                $s_width = $wh;
                $s_height = $wh / $resize_ratio;
            } else {
                $s_height = $wh;
                $s_width = $wh * $resize_ratio;
            }
            $snewimg = imagecreatetruecolor($s_width, $s_height);
            imagecopyresampled($snewimg, $this->im, 0, 0, 0, 0, $s_width, $s_height, $this->width, $this->height);
//			$snewimg = imagecreatetruecolor($this->resize_width,$this->resize_height);
//			imagecopyresampled($snewimg, $this->im, 0, 0, 0, 0, $this->resize_width, $this->resize_height, $this->width, $this->height);
            //创建空白正方目标图
            $newimg = imagecreatetruecolor($wh, $wh);
            $white = imagecolorallocate($newimg, 255, 255, 255);
            imagefill($newimg, 0, 0, $white);
            //填入图片
            imageCopyMerge($newimg, $snewimg, $dst_x, $dst_y, 0, 0, $s_width, $s_height, 100);
//			imageCopyMerge($newimg, $snewimg,$dst_x,$dst_y,0,0,$this->resize_width,$this->resize_height,100);
//			imageCopyMerge($newimg, $snewimg,$dst_x,$dst_y,0,0,$this->width*$wh/$this->height,$wh,100);
            $foreground_color = imagecolorallocate($newimg, 255, 0, 0);
            ImageJpeg($newimg, $this->dstimg, $this->config['thumb_quality']);
            ImageDestroy($snewimg);
        } else {
            /**
             * 不裁图
             */
            if ($ratio > 1) {//宽大高小
                $this->resize_height = $this->resize_width * ($this->height) / ($this->width);
            } else {
                $this->resize_width = $this->resize_height * ($this->width) / ($this->height);
            }
            $newimg = imagecreatetruecolor($this->resize_width, $this->resize_height);
            imagecopyresampled($newimg, $this->im, 0, 0, 0, 0, $this->resize_width, $this->resize_height, $this->width, $this->height);
            ImageJpeg($newimg, $this->dstimg, $this->config['thumb_quality']);//保存图片
        }


        /**
         * 销毁临时图
         */
        ImageDestroy($this->im);
        ImageDestroy($newimg);
    }

    private function thumb_im()
    {
        $this->dst_img();
        if ($this->scale > 0 && $this->filling) {
            $this->resize_width = $this->resize_height = $this->scale;
        }
//		if ($this->resize_height > $this->resize_width){
//			$this->resize_width = $this->resize_height;
//		}else{
//			$this->resize_height = $this->resize_width;
//		}
        $exec_str = rtrim($this->config['impath'], '/') . '/convert -quality ' . $this->config['thumb_quality'] . ' -thumbnail ' . $this->resize_width . 'x' . $this->resize_height . ' -gravity center -extent ' . $this->resize_width . 'x' . $this->resize_height . ' ' . $this->srcimg . ' ' . $this->dstimg;
        exec($exec_str);
    }

    /**
     * 初始化图象
     *
     * @param
     * @return
     */
    private function initi_img()
    {
        if ($this->type == "jpg") {
            $this->im = @imagecreatefromjpeg($this->srcimg);
        }
        if ($this->type == "gif") {
            $this->im = @imagecreatefromgif($this->srcimg);
        }
        if ($this->type == "png") {
            $this->im = imagecreatefrompng($this->srcimg);
        }
        if ($this->type == 'jpeg') {
            $this->im = imagecreatefromjpeg($this->srcimg);
        }
    }

    /**
     * 图象目标地址
     *
     * @param
     * @return
     */
    private function dst_img()
    {
        if ($this->dstimg == '') {
            $full_length = strlen($this->srcimg);
            $type_length = strlen($this->type);
            $name_length = $full_length - $type_length;
            $name = substr($this->srcimg, 0, $name_length - 1);
            $this->dstimg = $name . $this->small_ext . $this->type;
        } else {
            $line = str_replace('\\', '/', $this->srcimg);
            $img = explode('/', $line);
            $file = explode('.', $img[count($img) - 1]);
            $this->dstimg = $this->dstimg . '/' . $file[0] . $this->small_ext . $file[1];
        }
        $this->relative_dstimg = str_replace(BASE_PATH, '', $this->dstimg);
    }
}