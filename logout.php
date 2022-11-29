<?php
	include("connect_db.php");
	
	$save_last = date("h.m.s / d-m-Y");
	
	unset($_SESSION['userid']);
	unset($_SESSION['email']);
	unset($_SESSION['ime']);
	unset($_SESSION['prezime']);

	header("Location: /home");
	die();
?>