<?php  
require($_SERVER['DOCUMENT_ROOT'].'/PHPMailer-master/class.phpmailer.php');

$mail = new PHPMailer;

$mail->IsSMTP();                                    // Set mailer to use SMTP
$mail->Host = 'e-game.me';  				// Specify main and backup server
$mail->SMTPAuth = true;                             // Enable SMTP authentication
$mail->Username = '	gamehosting.info@gmail.com';            // SMTP username
$mail->Password = 'alpacino33';                    	// SMTP password
$mail->SMTPSecure = 'tls';                          // Enable encryption, 'ssl' also accepted

$mail->From = 'gamehosting.info@gmail.com';
$mail->FromName = 'E-Game.Me';


$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
$mail->IsHTML(true);  
?>