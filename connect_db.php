<?php
//header("Location: /logout.php");
//Kevia
include "./inc/libs/mysql2mysqli.php"; //root php 5.6 rewrite to php7+
error_reporting(E_ALL);
session_start();
ob_start();

define('HOST', '185.61.137.168');
define('DBUSER', 'emaxrsmh_egame');
define('DBPASS', 'emaxrsmh_egame');
define('DBNAME', 'emaxrsmh_egame');
//root
define('MASTER_HOST', '185.61.137.168');
define('MASTER_USER', '');
define('MASTER_PASS', '');
define('MASTER_NAME', '');

if (!$db=@mysql_connect(HOST, DBUSER, DBPASS)) {
	die ("<b>Doslo je do greske prilikom spajanja na MySQL...</b>");
}

if (!mysql_select_db(DBNAME, $db)) {
	die ("<b>Greska prilikom biranja baze!</b>");
}

//MASTER CONNECT
//$mdb = new mysqli(MASTER_HOST, MASTER_USER, MASTER_PASS, MASTER_NAME);

/* Jezik */

include 'jezik/index.php';

/* CS by GH.biz link */

$dl_link_cs = "https://cs.o-neon.info/"; // Link counter-strike 1.6

// Set all default avatar
//$avatar = mysql_query("UPDATE `klijenti` SET `avatar` = 'default.png' WHERE `status` = 'Aktivan'");
if(isset($srw_file)) {
	function ipadresa($srvid) {
		$port = query_fetch_assoc("SELECT `port`, `ip_id`, `box_id` FROM `serveri` WHERE `id` = '".$srvid."'");
		$ip = query_fetch_assoc("SELECT `ip` FROM `boxip` WHERE `ipid` = '".$port['ip_id']."'");
		$row = query_fetch_assoc("SELECT * FROM `serveri` WHERE `id` = '".$srvid."'");
		$box = query_fetch_assoc("SELECT * FROM `box` WHERE `boxid` = '".$row['box_id']."'");
		
		$ip = $ip['ip'].":".$port['port'];
		
		if($row['igra'] == "6") {
			$ip = $box['fdl_link']."/".$row['username']."/cstrike/";
		}
		
		return $ip;
	}
	
	function query_numrows($query) {
		$result = mysql_query($query);
		if ($result == FALSE) {
			$greska = mysql_real_escape_string(mysql_error());
			mysql_query("INSERT INTO error_log (number, string, file, line, datum, vrsta) 
						VALUES ('1', 
								'{$greska}', 
								'mysql_greska', 
								'mysql_greska',
								'".time()."',
								'1')
						") or die(mysql_error());
		}
		return (mysql_num_rows($result));
	}

	function query_fetch_assoc($query) {
		$result = mysql_query($query);
		if ($result == FALSE)
		{
			$greska = mysql_real_escape_string(mysql_error());
			mysql_query("INSERT INTO error_log (number, string, file, line, datum, vrsta) 
						VALUES ('1', 
								'{$greska}', 
								'mysql_greska', 
								'mysql_greska',
								'".time()."',
								'1')
						") or die(mysql_error());
		}
		return (mysql_fetch_assoc($result));
	}
}
/* Provera za LOGIN */

function is_login(){
	if(isset($_SESSION['userid'])){
		return true;
	} else {
		return false;
	}
}

/* Provera za PIN KOD */

function is_pin(){
	if(isset($_SESSION['_pin'])){
		return true;
	} else {
		return false;
	}
}

/* Provera za Demo klijenta */

function is_demo(){
	/*$p_demo = mysql_fetch_array(mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$_SESSION[userid]'"));
	if ($p_demo['username'] == "demo"||$p_demo['username'] == "demo_nalog")*/
	if($_SESSION['userid'] == 1) {
		return false;
	} else {
		return true;
	}
}

/* Client online */

if (isset($_SESSION['userid'])) {
$time_online = time();
mysql_query("UPDATE `klijenti` SET `lastactivity` = '$time_online' WHERE `klijentid` = '$_SESSION[userid]'");
}

/* GET IP ADRESS */

function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
        $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
 
    return $ipaddress;
}

/* GET HOSTNAME CLIENT IP */

function clientIpHost($client_ip) {
	$cl_ip_host = json_decode(file_get_contents("https://ipinfo.io/$client_ip/json/"));
	if ($cl_ip_host == true) {
		return $cl_ip_host->hostname;
	} else {
		return "HostName nije pronadjen.";
	}
}

/* RANDOM SIFRA */

function randomSifra($duzina){
	$karakteri = "abcdefghijkmnpqrstuvwxyz23456789ABCDEFGHJKLMNPQRSTUVWXYZ";
	$string = str_shuffle($karakteri);
	$sifra = substr($string, 0, $duzina);
	return $sifra;
}

function randomNumber($duzina){
	$karakteri = "1234567890";
	$string = str_shuffle($karakteri);
	$sifra = substr($string, 0, $duzina);
	return $sifra;
}

/* Provera SQL */

function sqli($text) {
	$text = mysql_real_escape_string($text);
	$text = htmlspecialchars($text);
	return $text;
}

/* GP - IGRA */

function gp_igra($game_id) {
	if ($game_id == "1") {
		return "Counter-Strike 1.6";
	} else if ($game_id == "1") {
		return 'Counter-Strike 1.6.';
	} else if ($game_id == "2") {
		return 'SAMP';
	} else if ($game_id == "3") {
		return 'Minecraft';
	} else if ($game_id == "4") {
		return 'Call of duty 4: Modern warfare';
	} else if ($game_id == "5") {
		return 'Counter-Strike: GO';
	} else if ($game_id == "6") {
		return 'FastDL';
	} else if ($game_id == "7") {
		return 'Team Speak 3';
	} else {
		return "Game?";
	}
}

/* LOKACIJA SERVERA */

function gp_lokacija($server_ip) {
	$location_ip = json_decode(file_get_contents("https://freegeoip.net/json/".$server_ip));
	if ($location_ip === true) {
		return $location_ip->country_code;
	} else {
		return "Lokacija nije pronadjena.";
	}
}

/* IME MODA */

function mod_ime($mod_id) {
	$mod_name = mysql_fetch_assoc(mysql_query("SELECT * FROM `modovi` WHERE `id` = '$mod_id'"));
	if ($mod_name == true) {
		return $mod_name['ime'];
	} else {
		return "Ne mogu pronaci mod.";
	}
}

/* IME KLIJENTA */

function userIme($user_id) {
	$ime_usera = mysql_fetch_assoc(mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$user_id'"));
	if ($ime_usera == true) {
		return $ime_usera['ime'].' '.$ime_usera['prezime'];
	} else {
		return "Ne mogu pronaci ime.";
	}
}

/* IME ADMINA */

function adminIme($user_id) {
	$ime_usera = mysql_fetch_assoc(mysql_query("SELECT * FROM `admin` WHERE `id` = '$user_id'"));
	if ($ime_usera == true) {
		return $ime_usera['fname'].' '.$ime_usera['lname'];
	} else {
		return "Ne mogu pronaci ime.";
	}
}

/* EMAIL KLIJENTA */

function userEmail($user_id) {
	$email_usera = mysql_fetch_assoc(mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$user_id'"));
	if ($email_usera == true) {
		return $email_usera['email'];
	} else {
		return "Ne mogu pronaci email.";
	}
}

/* KLIJENTOV NOVAC */

function userMoney($user_id) {
	$email_usera = mysql_fetch_assoc(mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$user_id'"));
	if ($email_usera == true) {
		return $email_usera['novac'];
	} else {
		return "Ne mogu pronaci klijentov novac.";
	}
}

/* KLIJENTOV NOVAC UPDATE*/

function userMoneyUpdate($user_id, $value, $sign) {
	if($sign == true) {
		$novac = (userMoney($user_id)+$value);
	} else {
		$novac = (userMoney($user_id)-$value);
	}
	
	$update = mysql_query("UPDATE `klijenti` SET `novac` = '$novac' WHERE `klijentid` = '$user_id'");
	
	return $update;
}


/* KLIJENTOVA VALUTA */

function userCurrency($user_id) {
	$email_usera = mysql_fetch_assoc(mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$user_id'"));
	if ($email_usera == true) {
		return $email_usera['currency'];
	} else {
		return "Ne mogu pronaci klijentovu valutu.";
	}
}

/* KLIJENTOVA DRZAVA */

function userCountry($user_id) {
	$email_usera = mysql_fetch_assoc(mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$user_id'"));
	if ($email_usera == true) {
		return $email_usera['zemlja'];
	} else {
		return "Ne mogu pronaci klijentovu zemlju.";
	}
}

/* KLIJENTOV NOVAC BEZ VALUTE */

function userMoneyWithoutValute($novac, $drzava) {
	$clientcurrency = mysql_fetch_array(mysql_query("SELECT * FROM `billing_currency` WHERE `zemlja`='{$drzava}'"));
	if($drzava=="srb"){
		$novac = $novac * $clientcurrency['multiply'];	
		$novacc = $novac;
		return $novacc;	
	} else if($drzava=="hr"){
		$novac = $novac * $clientcurrency['multiply'];		
		$novacc = $novac;
		return $novacc;		
	} else if($drzava=="bih"){
		$novac = $novac * $clientcurrency['multiply'];		
		$novacc = $novac;
		return $novacc;		
	} else if($drzava=="cg" || $drzava == "other"){
		$novacc = $novac;
		return $novacc;		
	} else if($drzava=="mk"){
		$novac = $novac * $clientcurrency['multiply'];		
		$novacc = $novac;
		return $novacc;		
	}
	return FALSE;
}

/* KLIJENTOV NOVAC + VALUTA */

function userMoneyWithValute($novac, $drzava) {
	$clientcurrency = mysql_fetch_array(mysql_query("SELECT * FROM `billing_currency` WHERE `zemlja`='{$drzava}'"));
	if($drzava == "srb"){
		$novac = $novac*$clientcurrency['multiply'];	
		$novacc = number_format(floatval($novac), 2).' RSD';
		return $novacc;	
	}else if($drzava == "hr"){
		$novac = $novac*$clientcurrency['multiply'];	
		$novacc = number_format(floatval($novac), 2).' HRK';
		return $novacc;		
	}else if($drzava == "bih"){
		$novac = $novac*$clientcurrency['multiply'];		
		$novacc = number_format(floatval($novac), 2).' BAM';
		return $novacc;		
	}else if($drzava == "cg" || $drzava == "other"){	
		$novacc = number_format(floatval($novac), 2).' EUR';
		return $novacc;		
	}else if($drzava == "mk"){
		$novac = $novac*$clientcurrency['multiply'];	
		$novacc = number_format(floatval($novac), 2).' MKD';
		return $novacc;		
	}
	return FALSE;
}

/* CREATE DATUM KLIJENTA */

function lastLogin($user_id) {
	$lastlogin = mysql_fetch_assoc(mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$user_id'"));
	if ($lastlogin == true) {
		return $lastlogin['lastlogin'];
	} else {
		return "Ne mogu pronaci datum.";
	}
}

/* USER AVATAR */

function userAvatar($user_id) {
	$userAvatar = mysql_fetch_assoc(mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$user_id'"));
	if ($userAvatar["avatar"] == "default.png") {
		return "/img/a/default.png";
	} else {
		return $userAvatar['avatar'];
	}
}

/* ZASTITA - ISPRAVI TEXT */

function ispravi_text($poruka) {
	return htmlspecialchars(mysql_real_escape_string(addslashes($poruka)));
}
function ispravi_text_sql($poruka) {
	return htmlspecialchars(addslashes($poruka));
}
function ispravi_text_html($poruka) {
	return htmlspecialchars($poruka);
}

?>