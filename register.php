<?php
include('./fnc/ostalo.php');

if (is_login() == true) {
    header("Location: /home");
    die();
} else {
    
}

$email      = ispravi_text($_GET['email']);
$ime        = ispravi_text($_GET['ime']);
$prezime    = ispravi_text($_GET['prezime']);

if ($email == ""||$ime == ""||$prezime == "") {
    $_SESSION['error'] = "Molimo popunite sva polja.";
    header("Location: create_user_acc.php");
    die();
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
        <div id="server_info_infor">    
            <div id="server_info_infor">
                <div id="server_info_infor2">
                    <div class="space" style="margin-top: 20px;"></div>
                    <div class="gp-home">
                        <img src="/img/icon/gp/gp-user.png" alt="" style="position:absolute;">
                        <h2>Registracija novog klijenta</h2>
                        
                        <div class="space" style="margin-top: 60px;"></div>

                        <div id="tiket_body">   
                            <div class="tiket_info">
                                <div class="tiket_info_c">
                                    <div class="tiket-header">
                                        <h3>
                                            <span class="fa fa-info-circle" style="color:#076ba6;font-size:19px;"></span>
                                            Registrujte se, besplatno je!
                                        </h3>
                                    </div>
                                    
                                    <div class="tiket-content">
                                        <div class="tiket_info_home">
                                            
                                            <div class="tiket_info_home_c_o">
                                                <form action="client_process.php?task=register_acc2" method="POST" autocomplete="off">
                                                    
                                                    <input hidden="" type="email" name="email" value="<?php echo $email; ?>">
                                                    <input hidden="" type="text" name="ime" value="<?php echo $ime; ?>">
                                                    <input hidden="" type="text" name="prezime" value="<?php echo $prezime; ?>">

                                                    <input type="text" name="username" placeholder="Korisnicko ime" required=""> <br />
                                                    <input type="password" name="pass" placeholder="Password" required=""> <br />
                                                    <input type="password" name="pass2" placeholder="Ponovite password" required=""> <br />
                                                    
                                                    <?php
                                                        $sig_kod_ac = randomSifra(5);
                                                        $_SESSION['sig_kod_ac'] = $sig_kod_ac;
                                                    ?>
                                                    <label for="sig_kod_c_ac">
                                                        <input disabled type="text" name="sig_kod_p" value="<?php echo $sig_kod_ac; ?>" style="width: 70px;" required="">
                                                    </label>
                                                    
                                                    <input id="sigkod" type="text" name="sig_kod_c_ac" style="width: 175px;" placeholder="Sig kod" required="">
                                                    
                                                    <br/>

                                                    <button>REGISTRUJ ME!</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php include('style/footer.php'); ?>
    
    <!-- JAVA -->
    <?php include('style/java.php'); ?>
    <script>
        window.onload = function() {
            var sigkod = document.getElementById('sigkod');
            sigkod.onpaste = function(e) {
                e.preventDefault();
            }
        }
    </script>

</body>
</html>