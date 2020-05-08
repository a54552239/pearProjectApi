<?php
use think\facade\Env;

return [
    'open' => Env::get('mail.open', false), //Weather open mail support
    'Host' => Env::get('mail.Host', 'smtp.example.com'),// Specify main and backup SMTP servers
    'SMTPAuth' => Env::get('mail.SMTPAuth', true),// Enable SMTP authentication
    'Username' => Env::get('mail.Username', 'example@example.com'),// SMTP username
    'Password' => Env::get('mail.Password', 'example'),// SMTP password
    'SMTPSecure' => Env::get('mail.SMTPSecure', 'tls'),// Enable TLS encryption, `ssl` also accepted
    'Port' => Env::get('mail.Port', 25),// TCP port to connect to
];
