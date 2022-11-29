<?php

$srw_file = "1";
$ts = "TeamSpeak3";

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

$ts_port = "10101";


require_once($_SERVER['DOCUMENT_ROOT'].'/core/inc/libs/ts/lib/ts3admin.class.php');

$ip = $server_ip['ip'];

if($server['igra'] != "7")
	header("Location:gp-info.php?id=$server_id");

$tsAdmin = new ts3admin($ip, $ts_port);

if($tsAdmin->getElement('success', $tsAdmin->connect())) {
	$tsAdmin->login($server['username'], $server['password']);
	$tsAdmin->selectServer($server['port']);
} else {
	$tsAdmin = new ts3admin($ip, $ts_port_try_2);
	if($tsAdmin->getElement('success', $tsAdmin->connect())) {
		$tsAdmin->login($server['username'], $server['password']);
		$tsAdmin->selectServer($server['port']);
	} else {
		$_SESSION['error'] = "Doslo je do greske.";
		header("Location: gp-servers.php");
		die();
	}
}

$ts_s_info 		= $tsAdmin->serverInfo();
if (isset($_POST['c_id']) && isset($_POST['poke_msg']) && isset($_POST['poke_true'])) {
	$Client_ID 	= $_POST['c_id'];
	$Poke_MSG 	= $_POST['poke_msg'];
	
	$poke_msg_ok = $tsAdmin->clientPoke($Client_ID, $Poke_MSG);
	
	if (!$poke_msg_ok) {
		$_SESSION['error'] = "Doslo je do greske.";
		header("Location: ts-info.php?id=$server_id");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste izvrsili komandu.";
		header("Location: ts-info.php?id=$server_id");
		die();
	}
}

if (isset($_POST['c_id']) && isset($_POST['kick_msg']) && isset($_POST['kick_true'])) {
	$Client_ID 	= $_POST['c_id'];
	$Kick_MSG 	= $_POST['kick_msg'];
	$kick_msg_ok = $tsAdmin->clientKick($Client_ID, 'server', $Kick_MSG);
	
	if (!$kick_msg_ok) {
		$_SESSION['error'] = "Doslo je do greske.";
		header("Location: ts-info.php?id=$server_id");
		die();
	} else {
		$_SESSION['info'] = "Uspesno ste izvrsili komandu.";
		header("Location: ts-info.php?id=$server_id");
		die();
	}
}

$Server_Online  = $ts_s_info['data']['virtualserver_status'];

if($Server_Online == 'online') {
	$Server_Online = "<span style='color:#54ff00;'>Online</span>"; 
} else {
	$Server_Online = "<span style='color:red;'>Server je offline.</span>";
}

$Server_Name 	= $ts_s_info['data']['virtualserver_name'];
$Server_Players = $ts_s_info['data']['virtualserver_clientsonline'].'/'.$ts_s_info['data']['virtualserver_maxclients'];

$ts_s_platform 	= $ts_s_info['data']['virtualserver_platform'];
$ts_s_version 	= $ts_s_info['data']['virtualserver_version'];
$ts_s_pass 		= $ts_s_info['data']['virtualserver_password'];

if ($ts_s_pass == '') {
	$ts_s_pass = "<span style='color:red;'>No</span>";
} else {
	$ts_s_pass = "<span style='color:#54ff00;'>Yes</span>";
}

$ts_s_autostart = $ts_s_info['data']['virtualserver_autostart'];

if ($ts_s_autostart == 1) {
	$ts_s_autostart = "<span style='color:#54ff00;'>Yes</span>";
} else {
	$ts_s_autostart = "<span style='color:red;'>No</span>";
}

if(isset($ts_s_info['data']['virtualserver_uptime'])) {
	$ts_s_uptime = $tsAdmin->convertSecondsToStrTime(($ts_s_info['data']['virtualserver_uptime']));
} else {
	$ts_s_uptime = '-';
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
				<li><a href="gp-voice.php">Voice Serveri</a></li>
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
                                <a href="produzi.php?id=<?php echo $server['id']; ?>" style="background:none;border:none;color:#fff;"><span class="fa fa-edit"></span></a>
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
                        <label style="color: #bbb;font-size: 12px;">IP adresa:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo 'ts.e-game.me:'.$server['port']; ?></strong></span>
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
                </div>
                <div class="server_infoInfo2">
                    <h5 class="pc-icon">Server Status <button style="background: none; border:none;"><i class="fa fa-refresh"></i></button></h5>
                    <div class="ServerInfoFTP">
                        <label style="color: #bbb;font-size: 12px;">Server status:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $Server_Online; ?></strong></span> <br/>
                        <label style="color: #bbb;font-size: 12px;">Ime servera:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $Server_Name; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Igraci:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $Server_Players; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Platform:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $ts_s_platform; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Server Vresion:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $ts_s_version; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">Auto Start:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $ts_s_autostart; ?></strong></span> <br/>

                        <label style="color: #bbb;font-size: 12px;">UpTime:</label>
                        <span><strong style="color: #0ba3fd;"><?php echo $ts_s_uptime; ?></strong></span> <br/>

                    </div>
                </div><br>
				<div id="webftp">
				<table>

			                                    <tbody>

			                                        <tr>

			                                            <th>Name</th>

			                                            <th>IP</th>

			                                            <th>Action</th>

			                                        </tr>



			                                        <?php

														#get clientlist

														$clients = $tsAdmin->clientList('-uid -away -voice -times -groups -info -country -icon -ip -badges');

														

														#print clients to browser

														foreach($clients['data'] as $client) {

															$getip = $tsAdmin->clientList('-ip');

															if($client['client_type'] == '0') {

																$avatar = $tsAdmin->clientAvatar($client['client_unique_identifier']);

																?>



																	<tr>

																		<td>

																			<!--<img src="data:image/png;base64,<?php /*echo $avatar['data']; */ ?>" class="avatar_ts_tbl"> -->

																			<?php echo $client['client_nickname']; ?>

																		</td>

																		<td>

																			<img src="/assets/img/icon/country/<?php echo $client['client_country']; ?>.png"> 

																			<?php echo $client['connection_client_ip']; ?>

																		</td>

																		<td style="width: 170px;">

						                                                	<li style="padding:0px 5px;border-radius: 0;">

						                                                		<a href="#" data-toggle="modal" data-target="#poke-auth_id_<?php echo $client['clid']; ?>">

							                                                		Poke <i class="glyphicon glyphicon-ok"></i>

							                                                	</a>

						                                                	</li>
																			
						                                                	<li style="padding:0px 5px;border-radius: 0;">

						                                                		<a href="#" data-toggle="modal" data-target="#kick-auth_id_<?php echo $client['clid']; ?>">

							                                                		Kick <i class="glyphicon glyphicon-ok"></i>

							                                                	</a>

						                                                	</li>

						                                                </td>

																	</tr>


																<?php 

															} ?>

<!-- POKE POPUP -->

<div id="poke-auth_id_<?php echo $client['clid']; ?>" class="modal fade" role="dialog">

	<div class="modal-dialog">

	    <div id="popUP"> 

	        <div class="popUP">

	            <form action="/ts-info.php?id=<?php echo $server_id; ?>" method="POST" autocomplete="off" id="modal-poke-auth">

	                <fieldset>

	                    <h2>Poke <?php echo $client['client_nickname']; ?></h2>

	                    <ul>

	                        <li>

	                            <label>Message:</label>

	                            <input type="hidden" name="c_id" value="<?php echo $client['clid']; ?>">

	                            <input type="hidden" name="poke_true" value="true">

	                            <input type="text" name="poke_msg" value="" class="short">

	                        </li>

	                        <div class="space clear"></div>

	                        <li style="text-align:center;background:none;border:none;">

	                        	<button> <span class="fa fa-check-square-o"></span> Poke</button>

	                        </li>

	                    </ul>

	                </fieldset>

	            </form>

	        </div>        

	    </div>  

	</div>

</div>

<!-- KRAJ - POKE (POPUP) -->



<!-- POKE POPUP -->

<div id="kick-auth_id_<?php echo $client['clid']; ?>" class="modal fade" role="dialog">

	<div class="modal-dialog">

	    <div id="popUP"> 

	        <div class="popUP">

	            <form action="/ts-info.php?id=<?php echo $server_id; ?>" method="POST" autocomplete="off" id="modal-kick-auth">

	                <fieldset>

	                    <h2>Kick <?php echo $client['client_nickname']; ?></h2>

	                    <ul>

	                        <li>

	                            <label>Message:</label>

	                            <input type="hidden" name="c_id" value="<?php echo $client['clid']; ?>">

	                            <input type="hidden" name="kick_true" value="true">

	                            <input type="text" name="kick_msg" value="" class="short">

	                        </li>

	                        <div class="space clear"></div>

	                        <li style="text-align:center;background:none;border:none;">

	                        	<button> <span class="fa fa-check-square-o"></span> Kick</button>

	                        </li>

	                    </ul>

	                </fieldset>

	            </form>

	        </div>        

	    </div>  

	</div>

</div>

<!-- KRAJ - POKE (POPUP) -->



														<?php }

													?>

			                                    </tbody>

			                                </table>
				</div>
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