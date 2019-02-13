<?php

use service\FileService;
use think\File;

/**
 * @param File $file
 * @param $path_name
 * @return array|bool
 * @throws \OSS\Core\OssException
 * @throws \think\Exception
 * @throws \think\exception\PDOException
 * @throws \Exception
 */
function _uploadFile(File $file, $path_name = '', $saveName = false)
{
    if (!$path_name) {
        $path_name = config('upload.base_path') . config('default');
    }
    if (!$file->checkExt(strtolower(sysconf('storage_local_exts')))) {
        \exception('不支持该文件类型', 1);
    }
    $path = $path_name;
    $info = $file->move($path, $saveName);
    if ($info) {
        $filename = str_replace('\\', '/', $path . '/' . $info->getSaveName());
//            $image = \think\Image::open($info->getRealPath());
//            $image->thumb($image->width() / 2, $image->height() / 2)->save($filename);//压缩
        $site_url = FileService::getFileUrl($filename, 'local');
        $fileInfo = FileService::save($filename, file_get_contents($site_url));
        if ($fileInfo) {
            return ['base_url' => $fileInfo['key'], 'url' => $fileInfo['url'], 'filename' => $file->getInfo('name'), 'uploadInfo' => $info];
        }
    }
    return false;
}



function getCurrentMember()
{
    return session('member');
}

function setCurrentMember($data)
{
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

