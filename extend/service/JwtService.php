<?php

namespace service;

use Firebase\JWT\JWT;

/**
 * JWT服务
 * Class JwtService
 * @package service
 */
class JwtService
{
    /**
     * 公共配置
     * @return array
     */
    public static function getCommonConfig()
    {
        $jwtConfig = config('jwt.');
        $time = time(); //当前时间
        $token = array(
            "iss" => $jwtConfig['iss'],
            "aud" => $jwtConfig['aud'],
            "iat" => $time,
            "nbf" => $time,
        );
        return $token;
    }

    /**
     * 创建初始token
     * @param $data
     * @return array 返回accessToken 和 refreshToken
     */
    public static function initToken($data)
    {
        $tokenList = [
            'accessToken' => self::getAccessToken($data),
            'refreshToken' => self::getRefreshToken($data),
            'tokenType' => config('jwt.tokenType') //token_type：表示令牌类型，该值大小写不敏感，这里用bearer
        ];
        return $tokenList;
    }

    /**
     * 获取accessToken
     * @param $data
     * @return string
     */
    public static function getAccessToken($data)
    {
        $accessToken = self::getCommonConfig();
        $jwtConfig = config('jwt.');
        $key = $jwtConfig['key'];
        $time = time();
        $accessToken['data'] = $data;
        $accessToken['scopes'] = 'access';
        $accessToken['exp'] = $time + $jwtConfig['accessTokenExp'];
        return JWT::encode($accessToken, $key, $jwtConfig['alg']);
    }

    /**
     * 获取refreshToken
     * @param $data
     * @return string
     */
    public static function getRefreshToken($data)
    {
        $refreshToken = self::getCommonConfig();
        $jwtConfig = config('jwt.');
        $key = $jwtConfig['key'];
        $time = time();
        $refreshToken['data'] = $data;
        $refreshToken['scopes'] = 'refresh';
        $refreshToken['exp'] = $time + $jwtConfig['refreshTokenExp'];
        return JWT::encode($refreshToken, $key, $jwtConfig['alg']);
    }


    /**
     * 根据refreshToken刷新accessToken
     * @param $refreshToken
     * @return array|object|string
     */
    public static function refreshAccessToken($refreshToken)
    {
        $decoded = self::decodeToken($refreshToken);
        if (isError($decoded)) {
            return $decoded;
        }
        return self::getAccessToken($decoded['data']);
    }

    /**
     * token解密
     * @param $token
     * @return array|object
     */
    public static function decodeToken($token)
    {
        $jwtConfig = config('jwt.');
//        JWT::$leeway = 60; //当前时间减去60，把时间留点余地
        try {
            $decoded = JWT::decode($token, $jwtConfig['key'], array($jwtConfig['alg']));//解密方式，这里要和签发的时候对应
        } catch (\Firebase\JWT\SignatureInvalidException $e) {  //签名不正确
            return error(1, $e->getMessage());
        } catch (\Firebase\JWT\BeforeValidException $e) {  // 签名在某个时间点之后才能用
            return error(2, $e->getMessage());
        } catch (\Firebase\JWT\ExpiredException $e) {  // token过期
            return error(3, $e->getMessage());
        } catch (\Exception $e) {  //其他错误
            return error(4, $e->getMessage());
        }
        return $decoded;
    }

}
