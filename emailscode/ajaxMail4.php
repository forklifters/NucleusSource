<?php
header('Access-Control-Allow-Origin: *');
error_reporting(0);
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$msg = "failure";
$isMailSent = true;

try{
	$to = $_POST['email'];
	$bodyMessage = $_POST['bodyMessage'];
	
	$subject = "Nucleus Token Sale";

	$message = '<html><body><div style="background:#051721; padding:10px 0px 10px 0px;">

	<p style="margin-bottom: 10px;" align="center"><img src="https://nucleus.vision/img/nucleus-icon.png"></p>

	<div style="width: 500px; margin:0px auto 0px auto; padding: 20px 35px; background: #FFF; border-radius: 15px;">

		<p style="font-family: "Titillium Web", sans-serif; font-size: 21px; text-align: left; color: #ffaa00;">

                    Dear '.$to.',

                </p>

		<p style="font-family: "Titillium Web", sans-serif; font-size: 21px; text-align: left; margin-top: 30px;">

                    '.$bodyMessage.'

                </p>

		<p style="border-bottom: solid 1px #e5e5e5; margin-bottom: 20px;"></p>

		<p style="font-family: "Titillium Web", sans-serif; font-size: 21px; text-align: left; margin-top: 20px;"><b>Warmly,</b><br>Nucleus.Vision</p>

	</div>

</div></body></html>';
	
	$mail = new PHPMailer(true);
	
	$mail->SMTPDebug = 0;                                 // Enable verbose debug output
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->Username = '';                 // SMTP username
    $mail->Password = '';                           // SMTP password
    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587;                                    // TCP port to connect to

    //Recipients
    $mail->setFrom('tokensale@nucleus.vision', 'Nucleus Vision');
    //$mail->addAddress('tokensale@nucleus.vision');//, 'Sada');     // Add a recipient
	$mail->addAddress($to);//, 'Sada');     // Add a recipient

    //Content
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = $subject;
    $mail->Body    = $message;

    $mail->send();
	
    $msg = "success";
	
	/*
	
	// Always set content-type when sending HTML email
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

	// More headers
	$headers .= 'From: Nucleus Vision<tokensale@nucleus.vision>' . "\r\n";

	$isMailSent = mail($to,$subject,$message,$headers);
	
	if($isMailSent){
		$msg = "success";
	}
	*/
	
	
	
	
}catch(\Exception $e){
	//$msg = $e->getMessage();   
}
echo $msg;
?>