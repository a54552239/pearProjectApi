<?php

return [
    'storage_type' => 'local', //local:本地，qiniu：七牛，oss：阿里云oss
    'storage_local_exts' => 'png,jpg,rar,doc,icon,mp4,zip,gif,jpeg,bmp,webp,mp4,m3u8,rmvb,avi,swf,3gp,mkv,flv,txt,docx,pages,epub,pdf,numbers,csv,xls,xlsx,keynote,ppt,pptx,mp3,wav,wma,ogg,aac,flac;', //支持上传的文件格式
    // 可用的第三方资源配置
    'qiniu' => [ //七牛云
        'storage_qiniu_bucket' => 'static',
        'storage_qiniu_domain' => 'example.xyz',
        'storage_qiniu_access_key' => 'example',
        'storage_qiniu_secret_key' => 'example',
        'storage_qiniu_is_https' => 'https',//域名前缀
    ],
    'oss' => [ // 阿里云oss
        'storage_oss_bucket' => 'vilson-static',
        'storage_oss_endpoint' => 'oss-cn-shenzhen.aliyuncs.com',
        'storage_oss_domain' => 'example.xyz',
        'storage_oss_keyid' => 'example',
        'storage_oss_secret' => 'example',
        'storage_oss_is_https' => 'https',//域名前缀
    ],
];
