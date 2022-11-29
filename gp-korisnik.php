﻿<?php
include 'connect_db.php';

if (is_login() == false) {
    $_SESSION['error'] = "Niste ulogovani.";
    header("Location: /home");
    die();
} else {
    /*$proveri_servere = mysql_num_rows(mysql_query("SELECT * FROM `serveri` WHERE `user_id` = '$_SESSION[userid]'"));
    if (!$proveri_servere) {
        $_SESSION['info'] = "Nemate kod nas servera.";
        header("Location: /home");
        die();
    }*/

    $proveri_usera = mysql_query("SELECT * FROM `klijenti` WHERE `klijentid` = '$_SESSION[userid]'");
    if (mysql_num_rows($proveri_usera) == 0) {
        $_SESSION['info'] = "Ovaj korisnik ne postoji...";
        header("Location: /home");
        die();
    }

    $uzmi_usera = mysql_fetch_array($proveri_usera);
}

?>
<!DOCTYPE html>
<html lang="sr">
<?php include('style/head2.php'); ?>
<body>
	<!-- Error script -->
	<?php include('style/err_script.php'); ?>
	
	<!-- HEADER BOX -->

	<?php include('style/header.php'); ?>

	<!-- LOGIN BOX --> 
	<div class="containerr">
	<?php include('style/login_provera2.php'); ?>

	<!-- NAV BOX -->

	<?php include('style/navigacija.php'); ?>

    <div id="ServerBox">
        <div id="server_info_menu">
            <div class="sNav">
                                <li><a href="gp-billing.php">Billing</a></li>
                <li><a href="gp-iplog.php">IP Log</a></li>
                <li><a href="client_process.php?task=logout">Logout</a></li> 
            </div>
        </div>

        <div id="server_info_infor">    
            <div id="server_info_infor">
                <div id="server_info_infor2">
                    <div class="space" style="margin-top: 20px;"></div>
                    <div class="gp-home">
                        <img src="/img/icon/gp/gp-user.png" alt="" style="position:absolute;">
                        <h2>Licni podaci</h2>
                        <h3 style="font-size: 12px;">Ovde mozete promeniti licne podatke!</h3>                       
                        
                        <div class="podForm" style="">
                            <?php if (is_pin() == false) { ?>
                                <strong style="color: #fff;">
                                    Kako bi pristupili opciji za editovanje vaših informacija potrebno je da ispravno unesete vaš pin kod!
                                </strong> 
                                <br /> <br />
                                <button class="btn btn-info btn-large btn-block" data-toggle="modal" data-target="#pin-auth"> <i class="fa fa-unlock"></i> OTKLJUCAJ
                                </span>
                            <?php } else { ?>

                                 
				    <label for="avatar">AVATAR </label>
				    <img src="<?php echo userAvatar($_SESSION['userid']); ?>" alt="" style="position:absolute;margin-left:70px;width:90px;height:90px;">
				    <br/>
					<br>
					<br>	
<br>
<br>

                                <form action="process.php?task=edit_korisnik" method="POST" autocomplete="off">
                                    <label for="ime">IME </label>
                                    <input type="text" name="ime" value="<?php echo $uzmi_usera['ime']; ?>" style="margin-left: 100px;">
                                    <br />

                                    <label for="prezime">PREZIME </label>
                                    <input type="text" name="prezime" value="<?php echo $uzmi_usera['prezime']; ?>" style="margin-left: 63px;"> <br />

                                    <label for="email">EMAIL </label>
                                    <input disabled name="email" value="<?php echo $uzmi_usera['email']; ?>" style="margin-left: 81px;">
                                    <?php if (is_pin() == true) { ?>
                                        <!-- <span style="margin-left:10px;color:#bbb;cursor:pointer;" data-toggle="modal" data-target="#email-auth"> Zahtijev za promenu email adrese</span> -->
                                    <?php } ?>
                                    <br />

					<label for="token">STANJE </label>
                                    <?php if (is_pin() == false) { ?>
                                        <input disabled name="token" style="margin-left: 76px;" value="SAKRIVEN -(ovo ne mozete da menjate)">
                                    <?php } else { ?>
                                        <input disabled name="email" value="<?php echo userMoneyWithValute(userMoney($_SESSION['userid']), userCountry($_SESSION['userid'])); ?>" style="margin-left: 70px;">
                                        <span style="margin-left:10px;color:#bbb;cursor:pointer;" <li>
		                            	<a href="/gp-addpayments.php" class="lock-btn btn">
		                            		<i class="fa fa-shopping-cart"></i> Dodajte Uplatu</a></li></span><br />
                                    <?php } ?>
				   
				    



                                    <label for="password">PASSWORD </label>
                                    <input type="password" name="password" placeholder="Ako ne zelite menjat ostavite prazno polje" style="margin-left: 42px;"> <br />

				    
                                    <label for="token">TOKEN </label>
                                    <?php if (is_pin() == false) { ?>
                                        <input disabled name="token" style="margin-left: 76px;" value="SAKRIVEN -(ovo ne mozete da menjate)">
                                    <?php } else { ?>
                                        <input disabled name="token" style="margin-left: 76px;" value="<?php echo $uzmi_usera['token']; ?>">
                                        <span style="margin-left:20px;color:#bbb;cursor:pointer;" data-toggle="modal" data-target="#token-auth"> Prikazi key token</span><br />
                                    <?php } ?>
				    <label for="avatar">AVATAR LINK </label>
                                    <input type="text" name="avatar" value="<?php echo $uzmi_usera['avatar']; ?>" style="margin-left: 33px;"> <br />
				    </br>
</br>
                                    <button style="padding: 5px 10px;background: #076ba6;color: #fff;cursor: pointer;font-size: 12px;font-weight: bold;border: 1px solid #fff;">SACUVAJ</button>
                                </form>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="space" style="margin-bottom: 20px;"></div>
                </div>
            </div>
        </div>
    </div>

    <?php if (is_login() == true) { ?>
        <!-- PIN (POPUP)-->
        <div class="modal fade" id="pin-auth" role="dialog">
            <div class="modal-dialog">
                <div id="popUP"> 
                    <div class="popUP">
                        <?php
                            $get_pin_toket = $_SERVER['REMOTE_ADDR'].'_p_'.randomSifra(100);
                            $_SESSION['pin_token'] = $get_pin_toket;
                        ?>
                        <form action="process.php?task=un_lock_pin" method="post" class="ui-modal-form" id="modal-pin-auth">
                            <input type="hidden" name="pin_token" value="<?php echo $get_pin_toket; ?>">
                            <fieldset>
                                <h2>PIN Code zastita</h2>
                                <ul>
                                    <li>
                                        <p>Vas account je zasticen sa PIN kodom !</p>
                                        <p>Da biste pristupili ovoj opciji, potrebno je da ga unesete u box ispod.</p>
                                    </li>
                                    <li>
                                        <label>PIN KOD:</label>
                                        <input type="password" name="pin" value="" maxlength="5" class="short">
                                    </li>
                                    <li style="text-align:center;">
                                        <button> <span class="fa fa-check-square-o"></span> Otkljucaj</button>
                                        <button type="button" data-dismiss="modal" loginClose="close"> <span class="fa fa-close"></span> Odustani </button>
                                    </li>
                                </ul>
                            </fieldset>
                        </form>
                    </div>        
                </div>  
            </div>
        </div>
        <!-- KRAJ - PIN (POPUP) -->

        <?php if (is_pin() == true) { ?>
            
            <!-- TOKEN (POPUP)-->
            <div class="modal fade" id="token-auth" role="dialog">
                <div class="modal-dialog">
                    <div id="popUP"> 
                        <div class="popUP">
                            <form action="process.php?task=client_new_token" method="POST" class="ui-modal-form" id="modal-token-auth">
                                <?php
                                    $new_token = randomSifra(30).'_'.$_SESSION['userid'];
                                    $_SESSION['new_token'] = $new_token;
                                ?>
                                <fieldset>
                                    <h2>PHP API Token</h2>
                                    <ul>
                                        <li>
                                            <p>
                                                Token sluzi za dodeljivanje privilegija vasih servera nekoj eksternoj aplikaciji. <br />
                                                Ako ne znate cemu ovo sluzi, onda vam verovatno nece ni trebati :) <br />
                                                Korisne PHP API TOKEN SKRIPTE: <a href="/api.php?token">KLIK!</a> <br />
                                            </p>
                                        </li>

                                        <li>
                                            <label for="token">Trenutni <br /> TOKEN</label>
                                            <input hidden type="text" name="stari_token" value="<?php echo $uzmi_usera['token']; ?>">
                                            <input disabled type="text" value="<?php echo $uzmi_usera['token']; ?>" style="width: 85%;">
                                        </li>

                                        <br />

                                        <p>
                                            Ovde mozete generisati novi PHP API token! <br />
                                            Ako ga promenite, sve aplikacije koje ga trenutno koriste gube pristup i moracete im ponovo upisati novi token! <br />
                                            Ukolio ocete da ostavite stari kliknite na 'dugme' "ODUSTANI" .
                                        </p>
                                        
                                        <li>
                                            <label for="token">Novi <br /> TOKEN</label>
                                            <input hidden type="text" name="new_token" value="<?php echo $new_token; ?>">
                                            <input disabled type="text" value="<?php echo $new_token; ?>" style="width: 85%;">
                                        </li>

                                        <li style="text-align:center;">
                                            <button> <span class="fa fa-check-square-o"></span> SACUVAJ</button>
                                            <button type="button" data-dismiss="modal" loginClose="close"> <span class="fa fa-close"></span> Odustani </button>
                                        </li>
                                    </ul>
                                </fieldset>
                            </form>
                        </div>        
                    </div>  
                </div>
            </div>
            <!-- KRAJ - TOKEN (POPUP) -->

        <?php } ?>

    <?php } ?>

    <!-- Php script :) -->


    
<!-- end containerr -->
	</div>
	<?php 
	include('style/footer.php');
	include('style/java.php');
	include('style/pin_provera.php'); ?>
	?>
</body>
</head>
