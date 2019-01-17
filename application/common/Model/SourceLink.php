<?php

namespace app\common\Model;


/**
 * 资源关联
 * Class TaskStar
 * @package app\common\Model
 */
class SourceLink extends CommonModel
{
    protected $append = [];

    /**
     * @param $sourceType
     * @param $sourceCode
     * @param $linkType
     * @param $linkCode
     * @param int $sort
     * @return SourceLink
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createSource($sourceType, $sourceCode, $linkType, $linkCode, $sort = 0)
    {
        $source = $link = null;
        switch ($sourceType) {
            case 'file':
                $source = File::where(['code' => $sourceCode])->find();
        }
        if (!$source) {
            throw new \Exception('该资源不存在', 1);
        }
        switch ($linkType) {
            case 'task':
                $link = Task::where(['code' => $linkCode])->find();
        }
        if (!$link) {
            throw new \Exception('关联主体不存在', 2);
        }
        $memberCode = getCurrentMember()['code'];
        $orgCode = getCurrentOrganizationCode();
        $fileData = [
            'code' => createUniqueCode('sourceLink'),
            'create_by' => $memberCode,
            'organization_code' => $orgCode,
            'source_type' => $sourceType,
            'source_code' => $sourceCode,
            'link_type' => $linkType,
            'link_code' => $linkCode,
            'sort' => $sort,
            'create_time' => nowTime(),
        ];
        $result = self::create($fileData);
        if ($linkType == 'task') {
            Task::taskHook(getCurrentMember()['code'], $linkCode, 'linkFile', '', 0, '', '', '', ['title' => $source['fullName'], 'url' => $source['file_url']]);
        }
        return $result;
    }

    public static function getSourceDetail($sourceCode)
    {
        $source = self::where(['code' => $sourceCode])->find();
        $sourceDetail = null;
        switch ($source['source_type']) {
            case 'file':
                $source['title'] = '';
                $sourceDetail = File::where(['code' => $source['source_code']])->field('id', true)->find();
                if ($sourceDetail) {
                    $source['title'] = $sourceDetail['title'];
                    $project = Project::where(['code' => $sourceDetail['project_code']])->field('name')->find();
                    $sourceDetail['projectName'] = $project['name'];
                }
        }
        $source['sourceDetail'] = $sourceDetail;
        return $source;
    }

    public function deleteSource($code)
    {
        $source = self::where(['code' => $code])->find();
        if (!$source) {
            throw new \Exception('该资源不存在', 1);
        }
        $source = self::getSourceDetail($code);
        $result = self::where(['code' => $code])->delete();
        if ($source['link_type'] == 'task') {
            Task::taskHook(getCurrentMember()['code'], $source['link_code'], 'unlinkFile', '', 0, '', '', '', ['title' => $source['title'], 'url' => $source['sourceDetail']['file_url']]);
        }
        return $result;
    }

}
