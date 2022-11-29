<?php

$srw_file = "1";

include 'connect_db.php';

if (is_login() == false) {
    $_SESSION['error'] = "Niste logirani!";
    header("Location: /home");
    die();
} else {
    $server_id = $_GET['id'];
    $proveri_server = mysql_num_rows(mysql_query("SELECT * FROM `serveri` WHERE `id` = '$server_id' AND `user_id` = '$_SESSION[userid]'"));

    $server = mysql_fetch_array(mysql_query("SELECT * FROM `serveri` WHERE `id` = '$server_id' AND `user_id` = '$_SESSION[userid]'"));
    $server_ip = mysql_fetch_array(mysql_query("SELECT * FROM `box` WHERE `boxid` = '$server[box_id]'"));

    if (!$proveri_server) {
        $_SESSION['error'] = "Taj server ne postoji ili nemate ovlaščenje za isti.";
        header("Location: /gp-home.php");
        die();
    }
}

//LGSL - SERVER INFO
require './inc/libs/lgsl/lgsl_class.php';

$ss_ip = $server_ip['ip'];
$ss_port = $server['port'];
$info = mysql_fetch_array(mysql_query("SELECT * FROM `lgsl` WHERE ip='$ss_ip' AND q_port='$ss_port' AND c_port='$ss_port'"));

if($server['igra'] == "7")
	header("Location:ts-info.php?id=$serverid");

if($server['igra'] == "6")
	$new_ip = ipadresa($server['id']);

if($server['igra'] == "1") { $igras = "halflife"; }
else if($server['igra'] == "2") { $igras = "samp"; }
else if($server['igra'] == "4") { $igras = "callofduty4"; }
else if($server['igra'] == "3") { $igras = "minecraft"; }
else if($server['igra'] == "5") { $igras = "mta"; }

if($server['igra'] == "5") {
    $serverl = lgsl_query_live($igras, $info['ip'], NULL, $server['port']+123, NULL, 's');
} else if($server['igra'] != "6") {
    $serverl = lgsl_query_live($igras, $info['ip'], NULL, $server['port'], NULL, 's');
} else if($server['igra'] == "6") {
	$server_onli = "<span style='color:#54ff00;'>Online</span>"; 
}

if((@$serverl['b']['status'] == '1') && $server['igra'] != "6") {
    $server_onli = "<span style='color:#54ff00;'>Online</span>"; 
} else {
    if (($server['startovan'] == "1") && $server['igra'] != "6") {
        $server_onli = "<span style='color:red;'>Server je offline.</span>";
    } else if($server['igra'] != "6") {
        $server_onli = "<span style='color:red;'>Server je stopiran u panelu.</span>";
    }
}
if($server['igra'] != "6") {
	$server_mapa = @$serverl['s']['map'];
	$server_name = @$serverl['s']['name'];
	$server_play = @$serverl['s']['players'].'/'.@$serverl['s']['playersmax'];
	
	if ($server_name == "") {
		$server_name = "n/a";
	}
	if ($server_mapa == "") {
		$server_mapa = "n/a";
	}
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
                <li><a href="gp-home.php">Vesti</a></li>
                <li><a href="gp-servers.php">Serveri</a></li>
				<li><a href="gp-fdlserver.php">FastDL Serveri</a></li>
                <li><a href="gp-billing.php">Billing</a></li>
                <li><a href="gp-narudzbine.php">Narudžbine</a></li>
                <li><a href="gp-support.php">Podrška</a></li>
                <li><a href="gp-settings.php">Podešavanja</a></li>
                <li><a href="gp-iplog.php">IP Log</a></li>
                <li><a href="client_process.php?task=logout">Logout</a></li> 
            </div>
        </div>

        <div id="server_info_infor">

            <div id="server_info_infor2">
                <div id="ftp_header">
                    <div id="left_header">
                        <div style="margin-top:15px;color: #fff;">
                            <strong><?php echo $server['name']; ?></strong>
                        </div>
                    </div>
					<?php if ($server['igra'] != "6") { ?>
                    <div id="right_header">
                        <div class="info_buttn">
                            <!-- stop/start/restart/reinstall/kill -->
                            <?php include('style/s_s_r_r_k.php'); ?>
                        </div>
                    </div>
					<?php } ?>
                </div>
				
                <!-- Server meni precice -->
                <div class="space" style="margin-top: 20px;"></div>
                <?php include('style/server_nav_precice.php'); ?>
				
                <div class="server_infoInfo">
                    <h5>Informacije o serveru</h5>
                    <div class="SrwInfo_Info">
                        <label style="color: #bbb;font-size: 12px;">Ime servera:</label>
                        <?php  
                            if (is_pin() == false) {
                                $provera_pin = "#pin-auth"; 
                            } else {
                                $provera_pin = "#edit_name";
                            }
                        ?>
                        <span>
                            <strong style="color: #0ba3fd;">
                                <?php echo $server['name']; ?>
                                <button style="background:none;border:none;color:#fff;" type="button" data-toggle="modal" data-target="<?php echo $provera_pin; ?>"><span class="fa fa-edit"></span></button>
                            </strong>
                        </span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Datum isteka:</label>
                        <span>
                            <strong style="color: #0ba3fd;">
                                <?php echo $server['istice']; ?>
                                <a href="gp-addpayments.php?id=<?php echo $server['id']; ?>" style="background:none;border:none;color:#fff;"><i class="fa fa-edit"></i> [Produzi]</a></li></span></a>
                            </strong>
                        </span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Igra:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo gp_igra($server['igra']); ?></strong></span> <br/>
						<?php if($server['igra'] != "6") {?>
                        <label style="color: #bbb;font-size: 12px;">Lokacija:</label>
                        <span>
                            <?php  
                                $location_ip = json_decode(file_get_contents("http://ip-api.com/json/".$ss_ip));
                                $ip_gp_lokacija = $location_ip->countryCode;
                                $ip_gp_loc_name = $location_ip->country;
                            ?>
                            <strong style="color: #0ba3fd;" title="<?php echo $ip_gp_loc_name; ?>" data-toggle="tooltip" data-placement="right">
                                <?php echo $ip_gp_lokacija; ?> 
                                <i class="fa fa-chevron-right" style="font-size: 12px;"></i>
                                <img src="img/icon/country/<?php echo $ip_gp_lokacija; ?>.png">
                            </strong>
                        </span> <br/>
						<?php }?>
                        <label style="color: #bbb;font-size: 12px;"><?php if($server['igra'] != "6") { echo "IP adresa:"; } else  { echo "FastDL Link:"; } ?></label>
                        <span><strong style="color: #0ba3fd;"><?php if($server['igra'] == "6") echo $new_ip; else echo $server_ip['ip'].':'.$server['port']; ?></strong></span>
                        <br/>
						
                        <label style="color: #bbb;font-size: 12px;">GP-Status:</label>
                        <?php
                            $serverStatus = $server['status'];  
                            if ($serverStatus == "Aktivan") {
                                $serverStatus = "<span style='color: #54ff00;'> Aktivan </span>";
                            } else if($serverStatus == "Suspendovan") {
                                $serverStatus = "<span style='color: #ffd800;'> Suspendovan </span>";
                            } else {
                                $serverStatus = "<span style='color: red;'> Neaktivan </span>";
                            }
                        ?> 
                        <span><strong style="color: #0ba3fd;"><?php echo $serverStatus; ?></strong></span>
                     </div>
					 <?php if($server['igra'] != "6") {?>
                    <h5 class="server-activity">Grafik online igraca</h5>
                    <div id="chart"></div>
					<?php } ?>
                </div>
				
                <div class="server_infoInfo2">
                    <h5 class="pc-icon">FTP informacije</h5>
                    <div class="ServerInfoFTP">
                        <label style="color: #bbb;font-size: 11px;">FTP IP:</label>
                        <span><strong style="color: #0ba3fd;font-size: 13px;"><?php echo $server_ip['ip']; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 11px;">FTP Port:</label>
                        <span><strong style="color: #0ba3fd;font-size: 13px;">21</strong></span> <br/>

                        <label style="color: #bbb;font-size: 11px;">FTP User:</label>
                        <span><strong style="color: #0ba3fd;font-size: 13px;"><?php echo $server['username']; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 11px;">FTP PW:</label>
                        <span>
                            <strong style="color: #0ba3fd;font-size: 13px;">
                                <?php if (is_pin() == false) { ?>
                                   [SAKRIVENA] Klikni ovde da je prikazes ------
                                   <i class="fa fa-chevron-right" style="font-size: 12px;"></i>
                                <?php } else { echo $server['password']; } ?>    
                            </strong>
	
		<div class="prikaziFTPpW right">
                            <?php if (is_pin() == false) { ?>
                            <a style="cursor: pointer;" type="button" data-toggle="modal" data-target="#pin-auth">Prikazi FTP sifru</a>
                            <?php } else { ?> 
                            <a style="cursor: pointer;" type="button" data-toggle="modal" data-target="#ftp-pw">Promeni FTP sifru</a>
                            <?php } ?>

                        </div>
                    </div>
                </div>  
	             <?php if($server['igra'] != "6") {?>
                <div class="server_infoInfo3">
                    <h5 class="pc-icon">Server Status <button style="background: none; border:none;"><i class="fa fa-refresh"></i></button></h5>
                    <div class="ServerInfoFTP">
                        <label style="color: #bbb;font-size: 12px;">Server status:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $server_onli; ?></strong></span> <br/>
                        <?php if ($server['startovan'] == "1") {
                            if (@$serverl['b']['status'] == '0') { ?>
                                <label style="color: #bbb;font-size: 12px;">Moguce resenje:</label>
                                <span><strong style="color: #0ba3fd;">Izbacite zadnji plugin koji ste dodali.</strong></span> <br/> 
                        <?php } } ?> 
                        <label style="color: #bbb;font-size: 12px;">Ime servera:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $server_name; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Mapa:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $server_mapa; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Igraci:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $server_play; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Rank:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $server['rank']; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">MOD:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo mod_ime($server['mod']); ?></strong></span> <br/>
                    </div>
                </div>

                <div class="grafik" style="margin: -20px 0px 20px 0px;">
                    <img src="/grafik/index.php?ip=<?php echo $server_ip['ip'].'&port='.$server['port']; ?>&baner=false" alt="GRAFIK" style="width: 350px;height: 150px;background: transparent url(//i.imgur.com/iOLR4Iu.gif) center no-repeat;">
                     <br> <br><br>
                    				</div>
                
                <!-- server ftp precice -->
                <?php include('style/server_precice.php');
				} ?>
            </div>
        </div>
    </div>

    <!-- Php script :) -->

<!-- end containerr -->
	</div>
	<?php 
	include('style/footer.php');
	include('style/java.php');
	include('style/pin_provera.php'); ?>