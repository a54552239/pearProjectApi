<?php
namespace App\Common;
class Request extends \PhalApi\Request
{
    public function getService()
    {
        $service = $this->get('api');
        if (!empty($service)) {
            $namespace = count(explode('/', $service)) == 2 ? 'App.' : '';
            return $namespace . str_replace('/', '.', $service);
        }
        return parent::getService();
    }
}