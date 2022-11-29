<?php

error_reporting(0);

// KONEKCIJA NA MYSQL

$con = mysqli_connect(
"localhost", // HOST
"baza_user", // DATABASE USERNAME
"ts123456", // PASSWORD
"baza"); // DATABASE

date_default_timezone_set('Europe/Belgrade');
$vreme = date("m:i");


// Time ago function
function time_ago($timestamp){
	$difference = time() - $timestamp;
	if($difference < 60){
		return $difference."s";
	} else {
		$difference = round($difference / 60);
		if($difference < 60){
			return $difference."m";
		} else {
			$difference = round($difference / 60);
			if($difference < 24){
				return $difference."h";
			} else {
				$difference = round($difference / 24);
				if($difference < 7){
					return $difference."d";
				} else {
					$difference = round($difference / 7);
					return $difference."w";
				}
			}
		}
	}
}


  $ip_port	= explode(":", $_GET['ip']&$_GET['port']);
  $ip			= $ip_port[0];
  $port		= $ip_port[1];

  $srv = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM servers WHERE ip='$ip' AND port='$port'"));



?>