<?php  
include("connect_db.php");

//LOGOUT

if (isset($_GET['task']) && $_GET['task'] == "logout") {
	$save_last = date("h.m.s / d-m-Y");
	unset($_SESSION['userid']);
	unset($_SESSION['email']);
	unset($_SESSION['ime']);
	unset($_SESSION['prezime']);
	header("Location: /home");
	die();
}

//CREATE ACC ~ REGISTER STEP 1

if (isset($_GET['task']) && $_GET['task'] == "register_acc") {
	if (is_login() == true) {
		header("Location: /home");
		die();
	}

	$email 		= ispravi_text($_POST['email']);
	$ime 		= ispravi_text($_POST['ime']);
	$prezime 	= ispravi_text($_POST['prezime']);
	$Sig_Kod 	= ispravi_text($_SESSION['sig_kod_ac']);
	$Sig_Kod_p 	= ispravi_text($_POST['sig_kod_c_ac']);

	if ($email == ""||$ime == ""||$prezime == ""||$Sig_Kod == ""||$Sig_Kod_p == "") {
		$_SESSION['error'] = "Proverite jeste li zaboravili popuniti neko polje.";
		header("Location: /register/step/1");
		die();
	}

	if ($Sig_Kod == $Sig_Kod_p) {

		$proveri_ostalo = mysql_fetch_array(mysql_query("SELECT * FROM `klijenti` WHERE `email` = '$email'"));

    	if ($proveri_ostalo == true) {
    		$_SESSION['error'] = "Ovaj email je vec zauzet!";
	    	header("Location: create_user_acc.php");
	    	die();
    	} else {
    		$_SESSION['ok'] = "Uspesno ste prosli prvi korak, molimo resite i drugi.";
		    header("Location: /register.php?email=$email&ime=$ime&prezime=$prezime");
		    die();
    	}
	} else {
		$_SESSION['error'] = "Sigurnosni kod nije tacno napisan, molimo popunite ponovo vase podatke.";
	    header("Location: create_user_acc.php");
	    die();
	}
}

//CREATE ACC ~ REGISTER STEP 2

if (isset($_GET['task']) && $_GET['task'] == "register_acc2") {
	if (is_login() == true) {
		header("Location: /home");
		die();
	}

	$email 		= ispravi_text($_POST['email']);
	$ime 		= ispravi_text($_POST['ime']);
	$prezime 	= ispravi_text($_POST['prezime']);
	$username 	= ispravi_text($_POST['username']);
	$pass 		= ispravi_text($_POST['pass']);
	$pass2 		= ispravi_text($_POST['pass2']);
	$Sig_Kod 	= ispravi_text($_SESSION['sig_kod_ac']);
	$Sig_Kod_p 	= ispravi_text($_POST['sig_kod_c_ac']);

	if ($email == ""||$ime == ""||$prezime == ""||$username == ""||$pass == ""||$pass2 == ""||$Sig_Kod == ""||$Sig_Kod_p == "") {
		$_SESSION['error'] = "Proverite jeste li zaboravili popuniti neko polje.";
		header("Location: /register/step/1");
		die();
	}

    if ($Sig_Kod == $Sig_Kod_p) {

    	$proveri_ostalo = mysql_fetch_array(mysql_query("SELECT * FROM `klijenti` WHERE `email` = '$email'"));

    	if ($proveri_ostalo == true) {
    		$_SESSION['error'] = "Ovaj email je vec zauzet!";
	    	header("Location: create_user_acc.php");
	    	die();
    	} else {

    		$username_p_s = strlen($username);
			if ($username_p_s < 4){
				$_SESSION['error'] = "Username je prekratak!";
		    	header("Location: /create_user_acc.php");
		    	die();
		    }

		    $pass_p_s = strlen($pass);
			if ($pass_p_s < 5){
				$_SESSION['error'] = "Lozinka je prekratka!";
		    	header("Location: /create_user_acc.php");
		    	die();
		    }

		    $email_p_s = strlen($email);
			if ($email_p_s < 5){
				$_SESSION['error'] = "Email je prekratak!";
		    	header("Location: /create_user_acc.php");
		    	die();
		    }

    		if ($pass == $pass2) {
    			$pass = md5($pass);
    		} else {
    			$_SESSION['error'] = "Lozinke se ne poklapaju!";
		    	header("Location: /register.php?email=$email&ime=$ime&prezime=$prezime");
		    	die();
    		}

    		$sig_rand 	= randomNumber(5);
    		$token 		= randomSifra(30);
    		$ip_cl 		= get_client_ip();
    		$ip_host 	= clientIpHost($ip_cl);
    		$d_v 		= date('Y-m-d');

    		$reg_ok = mysql_query("INSERT INTO `klijenti` (`klijentid`, 
    														`username`, 
    														`sifra`, 
    														`ime`, 
    														`prezime`, 
    														`email`, 
    														`beleske`, 
    														`novac`, 
    														`currency`, 
    														`status`, 
    														`lastlogin`,
    														`lastactivity`, 
    														`lastip`, 
    														`lasthost`,
    														`kreiran`, 
    														`zemlja`, 
    														`avatar`, 
    														`cover`, 
    														`banovan`, 
    														`sigkod`, 
    														`token`, 
    														`mail`) VALUES (NULL, '$username', 
    																				'$pass', 
    																				'$ime', 
    																				'$prezime', 
    																				'$email', 
    																				'Registrovan.', 
    																				'0', 
    																				'0', 
    																				'Aktivan', 
    																				'0', 
    																				'0', 
    																				'$ip_cl', 
    																				'$ip_host', 
    																				'$d_v', 
    																				'0', 
    																				'default.png', 
    																				'cover.jpg',
    																				'0', 
    																				'$sig_rand', 
    																				'$token', 
    																				'1');");
		
	    	if ($reg_ok == true) {
	    		$_SESSION['ok'] = "Uspesno ste se registrovali, sad se mozete ulogovati!";
			    header("Location: /home");
			    die();
	    	} else {
	    		$_SESSION['error'] = "DOSLO JE DO GRESKE!";
	    		header("Location: create_user_acc.php");
	    		die();
	    	}
    	}

	} else {
		$_SESSION['error'] = "Sigurnosni kod nije tacno napisan, molimo popunite ponovo vase podatke.";
	    header("Location: /register.php?email=$email&ime=$ime&prezime=$prezime");
	    die();
	}
}

?>