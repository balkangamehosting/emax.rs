<?php
ob_start(); 
session_start();
//error_reporting(0);
require 'connect_db.php';

date_default_timezone_set('Europe/Belgrade');



// FUNKCIJE 


function email_exists($email) {
	$email = sanitize($email);
	$query = mysqli_query($con,"SELECT COUNT(`user_id`) FROM `users` WHERE `email` = '$email'");
	return (mysql_result($query, 0) == 1) ? true : false;
}

function user_exists($username) {
	$username = sanitize($username);
	$query = mysqli_query($con,"SELECT COUNT(`user_id`) FROM `users` WHERE `username` = '$username'");
	return (mysqli_free_result($query, 0) == 1) ? true : false;
}

function user_active($username) {
	$username = sanitize($username);
	$query = mysqli_query($con,"SELECT COUNT(`user_id`) FROM `users` WHERE `username` = '$username'");
	return (mysqli_free_result($query, 0) == 1) ? true : false;
}

function user_id_from_username($username) {
	$username = sanitize($username);
	$query = mysqli_query($con,"SELECT `user_id` FROM `users` WHERE `username` = '$username'");
	return mysqli_free_result($query, 0, 'user_id');
}
function username_from_user_id($user_id) {
	$username = sanitize($user_id);
	$query = mysqli_query($con,"SELECT `username` FROM `users` WHERE `user_id` = '$user_id'");
	return @mysqli_free_result($query, 0, 'username');
}
function login($username, $password) {
	$user_id = user_id_from_username($username);
	$username = sanitize($username);
	$password = md5($password);
	$query = mysqli_query($con,"SELECT COUNT(`user_id`) FROM `users` WHERE `username` = '$username' AND `password` = '$password'");
	return (mysqli_free_result($query, 0) == 1) ? $user_id : false;
}

function string_resize($string, $maxchar) {
	$length = strlen($string);
	if($length > $maxchar) {
		$cutsize = -($length-$maxchar);
		$string  = substr($string, 0, $cutsize);
		$string  = $string . "..";
	}
	return $string;
}




?>


<?php

	// SERVERI F-JE


function server_exists2($ip, $port) {
	$ip = sanitize($ip);
	$query = mysqli_query($con,"SELECT COUNT(`id`) FROM `servers` WHERE `ip` = '$ip' AND `port` = '$port'");
	return (mysqli_free_result($query, 0) == 1) ? true : false;
}

function get_country($ip) {
	if(!is_numeric($ip)){
		$ip = gethostbyname($ip);
	}
	$current_dir    = explode("/" ,$_SERVER['REQUEST_URI']);
	$current_dir    = array_slice($current_dir, 0, -1);
	$current_dir    = implode("/", $current_dir);
	$link 			= "http://api.wipmania.com/" . $ip;
	@$country 		= (file_get_contents($link)) ? file_get_contents($link) : "XX";
	//$icon   		= "http://" . $_SERVER['SERVER_NAME'] . $current_dir . "/includes/locations/" . $country . ".png";
	return $country ;
}


if (isset($_GET['task']) && $_GET['task'] == "izmeni_avatar") {
    $time = time();
    $userid = $_SESSION['userid'];
    if(isset($_FILES["file"])){
    $userid = $_SESSION['userid'];
    $errors = array();
    $allowed_ext = array('phtml','php','php3','php4','php5','php6','phps','cgi','exe','pl','asp','aspx','shtml','shtm','fcgi','fpl','jsp','htm','html','wml');
    $namn = $_FILES["file"]["name"];
	$value = explode(".", $namn);
    $ext = strtolower(array_pop($value));  
    $size = $_FILES["file"]["size"];
    $tmp = $_FILES["file"]["tmp_name"];
    if(in_array($ext, $allowed_ext) === true){
    $_SESSION['error'] = 'Tip fajla nije dozovljen';
	header("location:/korisnik/$userid");
	die();
    }
    if(empty($errors)){
    $name = time().'.'.$ext;
    if(move_uploaded_file($tmp,"avatari/".$name)){
	mysqli_query($con,"UPDATE users SET avatar='$name' WHERE userid='$_SESSION[userid]'");
	$_SESSION['ok'] = "Uspesno";
	header("location:/korisnik/$userid");
    } else {
    $_SESSION['error'] = "Niste izabrali sliku";
	header("location:/korisnik/$userid");
    die();
    }
    }else {
    foreach ($errors as $error){
    $_SESSION['error'] = "Error";
	header("location:/korisnik/$userid");
	die();
    }
    }
        
    } else {
    $_SESSION['error'] = "Error";
	header("location:/korisnik/$userid");
	die();
    }


}

else if (isset($_GET['task']) && $_GET['task'] == "izmeni_cover") {
    $time = time();
    $userid = $_SESSION['userid'];
    if(isset($_FILES["file"])){
    $userid = $_SESSION['userid'];
    $errors = array();
    $allowed_ext = array('phtml','php','php3','php4','php5','php6','phps','cgi','exe','pl','asp','aspx','shtml','shtm','fcgi','fpl','jsp','htm','html','wml');
    $namn = $_FILES["file"]["name"];
	$value = explode(".", $namn);
    $ext = strtolower(array_pop($value));  
    $size = $_FILES["file"]["size"];
    $tmp = $_FILES["file"]["tmp_name"];
    if(in_array($ext, $allowed_ext) === true){
    $_SESSION['error'] = 'Tip fajla nije dozovljen';
	header("location:/korisnik/$userid");
	die();
    }
    if(empty($errors)){
    $name = time().'.'.$ext;
    if(move_uploaded_file($tmp,"coveri/".$name)){
	mysqli_query($con,"UPDATE users SET cover='$name' WHERE userid='$_SESSION[userid]'");
	$_SESSION['ok'] = "Uspesno";
	header("location:/korisnik/$userid");
    } else {
    $_SESSION['error'] = "Niste izabrali sliku";
	header("location:/korisnik/$userid");
    die();
    }
    }else {
    foreach ($errors as $error){
    $_SESSION['error'] = "Error";
	header("location:/korisnik/$userid");
	die();
    }
    }
        
    } else {
    $_SESSION['error'] = "Error";
	header("location:/korisnik/$userid");
	die();
    }


}


else if (isset($_GET['task']) && $_GET['task'] == "login") {
	$username = htmlspecialchars(mysqli_real_escape_string($con,$_POST['username']));
	$password = htmlspecialchars(mysqli_real_escape_string($con,$_POST['password']));
	$cpass = md5($password);
	$kveri = mysqli_query($con,"SELECT * FROM users WHERE username='$username' AND password='$cpass'");


	if (mysqli_num_rows($kveri)) {
		$user = mysqli_fetch_array($kveri);
		$_SESSION['userid'] = $user['userid'];
		$_SESSION['username'] = $user['username'];
		$mesec = 24*60*60*31; // mesec dana
		$user_ip = $_SERVER['REMOTE_ADDR'];
		
		$time = time();
		
		$sesija = md5($user['username'] . $cpass);
		
		setcookie("userid", $_SESSION['user_id'], time()+ $mesec);
		setcookie("username", $_SESSION['username'], time()+ $mesec);
		setcookie("sesija", $sesija, time() + $mesec);
		
                                  $_SESSION['ok'] = "Uspesan login";
		header("Location:/new.php");
		} else {
	    $_SESSION['error'] = "Greska";
		header("location:/new.php");
		die();

	}
}

else if (isset($_GET['task']) && $_GET['task'] == "registracija") {
	$username = htmlspecialchars(mysqli_real_escape_string($con,$_POST['username']));
	$password = htmlspecialchars(mysqli_real_escape_string($con,$_POST['password']));
	$email = htmlspecialchars(mysqli_real_escape_string($con,$_POST['email']));
	$ime = htmlspecialchars(mysqli_real_escape_string($con,$_POST['ime']));
	$prezime = htmlspecialchars(mysqli_real_escape_string($con,$_POST['prezime']));
	$datum = date('d.m.Y');
	
	$time1 = time();
	$user_ip = $_SERVER['REMOTE_ADDR'];
	
        if(strlen($username) > 20 || strlen($username) < 4){
        $_SESSION['error'] = "Username je prekratak!";
		header("location:/new.php");
        die();
        }
		
		if($ime == ""||$prezime == ""){
		  $_SESSION['error'] = "Sva polja moraju biti popunjena!";
		  header("location:/new.php");
		  die();
		}
 
	$kveri = mysqli_query($con,"SELECT * FROM users WHERE username='$username'");
	if (mysqli_num_rows($kveri)>0) {
	    $_SESSION['error'] = "Username je zauzeto!";
		header("Location:/new.php");
		die();
	}
	$kveri = mysqli_query($con,"SELECT * FROM users WHERE email='$email'");
	if (mysqli_num_rows($kveri)>0) {
		$_SESSION['error'] = "Email je zauzet";
		header("Location:/new.php");
		die();
	}
	if ($password == $password){
		$cpass = md5($password);
		$sql = "INSERT INTO users (username,ime,prezime,password,email,register_time,user_ip,datum) VALUES ('$username','$ime','$prezime','$cpass','$email','$time1','$user_ip','$datum')";
		//echo $sql;
		mysqli_query($con,$sql);
		$_SESSION['ok'] = "Uspesna registracija";
		

	
		
		
		header("Location:/new.php");
	} else {
		$_SESSION['error'] = "Greska sa lozinkom!";
		header("Location:/new.php");
		die();
	}
}

else 
	
if (isset($_GET['task']) && $_GET['task'] == "izmeni_lozinku") {
	
	
	if($_SESSION['userid'] == "") {
		
		$_SESSION['error'] = "Morate se ulogovati";
		header("Location:/new.php");
		
	} else {
	
	$userid = $_SESSION['userid'];
	
	$user = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM users WHERE userid='$userid'"));
	
	$tl = $user['password'];
	
	
	$tpw = htmlspecialchars(mysqli_real_escape_string($con,$_POST['trenutni_pw']));
	$npw = htmlspecialchars(mysqli_real_escape_string($con,$_POST['novi_pw']));		
	
	$tpw1 = md5($tpw);
	$npw1 = md5($npw);
	
	
	
	if($tl == $tpw1) {
		
		$sql = "UPDATE users SET password = '$npw1' WHERE userid='$userid'";
		$kveri = mysqli_query($con,$sql);
		
		if(!$kveri) {
			
			$_SESSION['error'] = "Greska";
			header("Location:/korisnik/$userid");
			
		} else {
			
			$_SESSION['ok'] = "USPESNO!";
			header("Location:/korisnik/$userid");
			
		}
		
		
		
	}
	else {
		
		$_SESSION['error'] = "Trenutna lozinka nije tacna";
		header("Location:/korisnik/$userid");
		
	}
	
	
	
	} // LOGIN 
	
	
	
	
	
}

?>