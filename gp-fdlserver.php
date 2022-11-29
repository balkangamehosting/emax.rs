<?php

$srw_file = "1";

include 'connect_db.php';

if (is_login() == false) {
	$_SESSION['error'] = "Niste ulogovani.";
    header("Location: /home");
    die();
} else {
    $proveri_servere = mysql_num_rows(mysql_query("SELECT * FROM `serveri` WHERE `user_id` = '$_SESSION[userid]'"));
    if (!$proveri_servere) {
        $_SESSION['info'] = "Nemate kod nas servera.";
        header("Location: /home");
        die();
    }
}

?>
<!DOCTYPE html>
<html>
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
            <div id="server_info_infor">
                <div id="server_info_infor2">
                    <div class="space" style="margin-top: 20px;"></div>
                    <div class="gp-home">
                        <img src="/img/icon/gp/gp-server.png" alt="" style="position:absolute;margin-left:20px;">
                        <h2>Serveri</h2>
                        <h3 style="font-size: 12px;">Lista svih vasih servera</h3>
                        <div class="space" style="margin-top: 60px;"></div>
                        
                        <div id="serveri">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>Ime servera</th>
                                        <th>Vazi do</th>
                                        <th>Cena</th>
                                        <th>IP adresa</th>
                                        <th>Slotovi</th>
                                        <th>Status</th>
                                    </tr>
                                    <?php  
                                        $gp_obv = mysql_query("SELECT * FROM serveri WHERE igra = '6' AND user_id = '$_SESSION[userid]'");										
										function price_by_slot($igra, $srvid) {
											$serverslot = query_fetch_assoc("SELECT * FROM `serveri` WHERE `id` = '{$srvid}'");
											
											$cenaslota = query_fetch_assoc("SELECT `cena` FROM `modovi` WHERE `igra` = '{$igra}'");
											$cenaslota = explode("|", $cenaslota['cena']);
											
											$cena = $cenaslota[1];
											
											if($igra == 6)
												$serverslot['slotovi'] = 1;
											
											$out = round($cena * $serverslot['slotovi'],2);
											$out = number_format($out, 2);
											
											return $out;
										}
										
                                        while($row = mysql_fetch_array($gp_obv)) { 

                                            $srw_id = htmlspecialchars(mysql_real_escape_string(addslashes($row['id'])));
                                            $naziv_servera = htmlspecialchars(mysql_real_escape_string(addslashes($row['name'])));
                                            $istice = htmlspecialchars(mysql_real_escape_string(addslashes($row['istice'])));
                                            $box_id = htmlspecialchars(mysql_real_escape_string(addslashes($row['box_id'])));
                                            $port = htmlspecialchars(mysql_real_escape_string(addslashes($row['port'])));
                                            $slotovi = htmlspecialchars(mysql_real_escape_string(addslashes($row['slotovi'])));
                                            $cena = htmlspecialchars(mysql_real_escape_string(addslashes($row['cena'])));
                                            $status = htmlspecialchars(mysql_real_escape_string(addslashes($row['status'])));
                                            $igra = htmlspecialchars(mysql_real_escape_string(addslashes($row['igra'])));

                                            $serverStatus = $status;  
                                            if ($serverStatus == "Aktivan") {
                                                $serverStatus = "<span style='color: green;'> Aktivan </span>";
                                            } else if($serverStatus == "Suspendovan") {
                                                $serverStatus = "<span style='color: red;'> Suspendovan </span>";
                                            } else {
                                                $serverStatus = "<span style='color: red;'> Neaktivan </span>";
                                            }

                                            if ($igra == "1") {
                                                $igra = "img/icon/gp/game/cs.ico";
												$link = "gp-info.php?id=";
                                            } else if($igra == "2") {
                                                $igra = "img/icon/gp/game/samp.jpg";
												$link = "gp-info.php?id=";
                                            } else if($igra == "3") {
                                                $igra = "img/icon/gp/game/mc.png";
												$link = "gp-info.php?id=";
                                            } else if($igra == "4") {
                                                $igra = "img/icon/gp/game/cod.png";
												$link = "gp-info.php?id=";
                                            } else if($igra == "5") {
                                                $igra = "img/icon/gp/game/csgo.jpg";
												$link = "gp-info.php?id=";
                                            } else if($igra == "6") {
                                                $igra = "img/icon/gp/game/game-fdl.png";
												$link = "gp-info.php?id=";
                                            } else if($igra == "7") {
                                                $igra = "img/icon/gp/game/game-ts3.png";
												$link = "ts-info.php?id=";
                                            } else {
                                                $igra = "img/icon/gp/game/not-fount.png";
												$link = "gp-info.php?id=";
                                            }
											
                                            $server_ip = mysql_fetch_array(mysql_query("SELECT * FROM `box` WHERE `boxid` = '$box_id'"));
											
											$cena = price_by_slot($row['igra'], $row['id'] );
                                        ?>       
                                        <tr>
                                            <td>
                                                <img src="<?php echo $igra; ?>" style="width: 15px;">
                                                <a href="<?php echo $link."".$srw_id; ?>"><?php echo $naziv_servera ?></a>
                                            </td>
                                            <td><?php echo $istice; ?></td>
                                            <td><?php echo $cena; ?> &euro;</td>
                                            <td class="ip"><?php echo ipadresa($srw_id); ?></td>
                                            <td><?php echo $slotovi; ?></td>
                                            <td><div class="aktivan"><?php echo $serverStatus; ?></div></td>
                                        </tr>
                                    <?php } ?>                               
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="space" style="margin-bottom: 20px;"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Php script :) -->

    </div>
	<?php 
	include('style/footer.php');
	include('style/java.php');
	include('style/pin_provera.php');
?>

</body>
</html>