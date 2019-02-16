<?php

return [
    // 加密key
    'key' => 'pearProject',
    'alg' => 'HS256',
    //access_token有效时间
    'accessTokenExp' => 3600 * 24 * 7,
    //refresh_token有效时间
    'refreshTokenExp' => 3600 * 24 * 7,
    //签发者 可选
    'iss' => '',
    //接收该JWT的一方，可选
    'aud' => '',
    'tokenType' => 'bearer',
];
