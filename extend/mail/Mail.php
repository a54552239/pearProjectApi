<?php


namespace mail;

use PHPMailer\PHPMailer\PHPMailer;

/**
 * 邮件服务
 * Class Sms
 * @package sms
 */
class Mail
{
    public $mail;

    public function __construct()
    {
        $mail = new PHPMailer(true);
//        $mail->SMTPDebug = 2;                                 // Enable verbose debug output
        $mail->isSMTP();                                      // Set mailer to use SMTP
        $mail->Host = config('mail.Host');  // Specify main and backup SMTP servers
        $mail->SMTPAuth = config('mail.SMTPAuth');                               // Enable SMTP authentication
        $mail->Username = config('mail.Username');                 // SMTP username
        $mail->Password = config('mail.Password');                           // SMTP password
        $mail->SMTPSecure = config('mail.SMTPSecure');                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = config('mail.Port');                                    // TCP port to connect to
        $this->mail = $mail;
    }
}
