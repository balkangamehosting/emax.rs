<?php
include('./../connect_db.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/fnc/mail.php');

if(isset($_POST['lokacija'])) {
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	if($lokacija == "1") {
		$lokacija_baza = "Lite - Njemacka";
	} else if($lokacija == "2") {
		$lokacija_baza = "Lite - Poljska";
	} else if($lokacija == "3") {
		$lokacija_baza = "Lite - Francuska";
	} else if($lokacija == "4") {
		$lokacija_baza = "Premium - Srbija";
	} else if($lokacija == "5") {
		$lokacija_baza = "Premium - BiH";
	} else {
		$lokacija_baza = "Lite - Njemacka";
	}
} else {
	$lokacija_baza = "Lite - Njemacka";
}

if(isset($_POST['game_id'])) {
	$game_id 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['game_id'])));
	if($game_id == "1") {
		$game_base = "Counter-Strike 1.6";
	} else if($game_id == "2") {
		$game_base = "GTA San Andreas";
	} else if($game_id == "3") {
		$game_base = "Minecraft";
	} else if($game_id == "6") {
		$game_base = "Team-Speak 3";
	} else if($game_id == "10") {
		$game_base = "SinusBot";
	} else if($game_id == "11") {
		$game_base = "FastDL";
	}
}

if (isset($_GET['task']) && $_GET['task'] == "buy") {

	if ($_SESSION['userid'] == "") {
		$_SESSION['error'] = "Morate biti ulogovani!";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	
	$user_ip = $_SERVER['REMOTE_ADDR']; 
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$igra 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['game_id'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['slotovi'])));
	$serverName 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['naziv'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$serverMod 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mod'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cena'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	
	if ($ime == ""||$email == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	
	if ($serverName == "" && $_POST['game_id'] == "10") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	
	$billing_desc = "Game: $game_base | ServerName: $serverName | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`,
														`srw_name`,
														`srw_mod`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'0', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'$game_base',
																				'$serverName',
																				'$serverMod')");																				
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}


if (isset($_GET['task']) && $_GET['task'] == "buy_2") {
	
	$user_ip = $_SERVER['REMOTE_ADDR'];
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$lokacija == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: SinusBot | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'Na cekanju', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'SinusBot')");
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}


/* Naruci server | Counter-Strike 1.6 */

if (isset($_GET['task']) && $_GET['task'] == "buy_cs") {

	if ($_SESSION['userid'] == "") {
		$_SESSION['error'] = "Morate biti ulogovani!";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	
	$user_ip = $_SERVER['REMOTE_ADDR']; 
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$serverName 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['naziv'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$serverMod 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mod'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$serverName == ""||$lokacija == ""||$serverMod == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: Counter-Strike 1.6 | ServerName: $serverName | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`,
														`srw_name`,
														`srw_mod`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'0', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'Counter-Strike 1.6',
																				'$serverName',
																				'$serverMod')");																				
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}

/* Naruci server | Counter-Strike CS:GO */

if (isset($_GET['task']) && $_GET['task'] == "buy_csgo") {
	
	$user_ip = $_SERVER['REMOTE_ADDR']; 
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$serverName 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['naziv'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$serverMod 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mod'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$serverName == ""||$lokacija == ""||$serverMod == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: Counter-Strike GO | ServerName: $serverName | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`,
														`srw_name`,
														`srw_mod`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'Na cekanju', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'Counter-Strike GO',
																				'$serverName',
																				'$serverMod')");
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}

/* Naruci server | GTA San Andreas */

if (isset($_GET['task']) && $_GET['task'] == "buy_gta") {
	
	$user_ip = $_SERVER['REMOTE_ADDR'];
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$serverName 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['naziv'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$serverMod 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mod'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$serverName == ""||$lokacija == ""||$serverMod == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: GTA San Andreas | ServerName: $serverName | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`,
														`srw_name`,
														`srw_mod`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'Na cekanju', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'GTA San Andreas',
																				'$serverName',
																				'$serverMod')");
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}

/* Naruci server | Minecraft */

if (isset($_GET['task']) && $_GET['task'] == "buy_mc") {
	
	$user_ip = $_SERVER['REMOTE_ADDR'];
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$serverName 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['naziv'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$serverMod 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mod'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$serverName == ""||$lokacija == ""||$serverMod == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: Minecraft | ServerName: $serverName | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`,
														`srw_name`,
														`srw_mod`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'Na cekanju', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'Minecraft',
																				'$serverName',
																				'$serverMod')");
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}

/* Naruci server | Call Of Duty 2 */

if (isset($_GET['task']) && $_GET['task'] == "buy_cod2") {
	
	$user_ip = $_SERVER['REMOTE_ADDR'];
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$serverName 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['naziv'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$serverMod 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mod'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$serverName == ""||$lokacija == ""||$serverMod == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: Call Of Duty 2 | ServerName: $serverName | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`,
														`srw_name`,
														`srw_mod`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'Na cekanju', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'Call Of Duty 2',
																				'$serverName',
																				'$serverMod')");
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}

/* Naruci server | Call Of Duty 4 */

if (isset($_GET['task']) && $_GET['task'] == "buy_cod4") {
	
	$user_ip = $_SERVER['REMOTE_ADDR'];
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$serverName 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['naziv'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$serverMod 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mod'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$serverName == ""||$lokacija == ""||$serverMod == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: Call Of Duty 4 | ServerName: $serverName | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`,
														`srw_name`,
														`srw_mod`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'Na cekanju', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'Call Of Duty 4',
																				'$serverName',
																				'$serverMod')");
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}

/* Naruci server | Team-Speak 3 */

if (isset($_GET['task']) && $_GET['task'] == "buy_ts3") {
	
	$user_ip = $_SERVER['REMOTE_ADDR'];
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$serverName 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['naziv'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$serverName == ""||$lokacija == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: Team-Speak 3 | ServerName: $serverName | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`,
														`srw_name`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'Na cekanju', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'Team-Speak 3',
																				'$serverName')");
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}

/* Naruci server | SinusBot */

if (isset($_GET['task']) && $_GET['task'] == "buy_sinus") {
	
	$user_ip = $_SERVER['REMOTE_ADDR'];
	
	$ime 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['ime'])));
	$email 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['email'])));
	$slotovi_lite 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove'])));
	$slotovi_prem 		= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['odaberiteslotove2'])));
	$lokacija 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['lokacija'])));
	$nacin_p 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['nacinplacanja'])));
	$mjeseci 			= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['mjeseci'])));
	$cena 				= htmlspecialchars(mysql_real_escape_string(addslashes($_POST['cijenaserverainput'])));
	$d 					= date("d-m-Y");
	$v 					= date("h.m.s");
	if ($ime == ""||$email == ""||$lokacija == ""||$nacin_p == ""||$mjeseci == ""||$cena == "") {
		$_SESSION['error'] = "Morate popuniti sva polja.";
		header("Location: $_SERVER[HTTP_REFERER]");
        die();
	}
	if ($slotovi_lite == "") {
		$slotovi = $slotovi_prem;
	} else {
		$slotovi = $slotovi_lite;
	}
	
	$billing_desc = "Game: SinusBot | Lokacija: $lokacija_baza | Cena: $cena";
	$spremi = mysql_query("INSERT INTO `billing` (`id`, `klijentid`, 
														`iznos`, 
														`datum`, 
														`status`, 
														`vreme`, 
														`slotovi`, 
														`lokacija`, 
														`placaza`, 
														`description`, 
														`paytype`,
														`game`) VALUES(NULL, '$_SESSION[userid]', 
																				'$cena', 
																				'$d', 
																				'Na cekanju', 
																				'$v', 
																				'$slotovi',
																				'$lokacija', 
																				'$mjeseci', 
																				'$billing_desc', 
																				'$nacin_p',
																				'SinusBot')");
	if (!$spremi) {
		$_SESSION['error'] = "Doslo je do greske prilikom narucivanja vaseg servera... Javite se na info@E-Game.Me .";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste narucili svoj server, idite u billing i uplatite ga.";
		header("Location: $_SERVER[HTTP_REFERER]");
		die();
	}
}

?>