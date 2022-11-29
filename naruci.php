<?php
include 'connect_db.php';

if (is_login() == false) {
	$_SESSION['error'] = "Niste ulogovani.";
    header("Location: /home");
    die();
}


if(isset($_GET['game'])) {
	$Game_ID 	= $_GET['game'];
} else {
	$Game_ID 	= '';
}

$game_ = array(
	'1' => 'Counter-Strike 1.6',
	'2' => 'San Andreas Multiplayer',
	'3' => 'Minecraft',
	/*'4' => 'Call of Duty 2',*/
	/*'5' => 'Call of Duty 4',*/
	'6' => 'TeamSpeak 3',
	/*'7' => 'Counter-Strike GO',*/
	/*'8' => 'Multi Theft Auto',*/
	/*'9' => 'ARK',*/
	'10' => 'Sinus Bot',
	'11' => 'FastDL'
);

if (isset($_GET['game'])) {
	if(!in_array($_GET['game'], array('1','2','3','6','10','11'))) {
		$_SESSION['error'] = 'Duboko se izvinjavamo, ovu igru trenutno nemamo u ponudi! Cim budemo dobili javicemo vam.';
		header('Location:home');
		die();
	}
}

$location_ = array(
	'1' => 'Nemacka (Lite)',
	//'2' => 'Poljska (Lite)',
	//'3' => 'Francuska (Lite)',
	'4' => 'Srbija (Premium)'
	/*'5' => 'BiH (Premium)',*/
);

if (!isset($_GET['game'])) {
	$slot_ = array(
		'' => 'Odaberite prvo igru',
	);
} else if ($Game_ID == 1) {
	$slot_ = array(
		'12' => '12',
		'15' => '15',
		'18' => '18',
		'20' => '20',
		'22' => '22',
		'24' => '24',
		'26' => '26',
		'28' => '28',
		'30' => '30',
		'32' => '32',
	);
} else if ($Game_ID == 2) {
	$slot_ = array(
		'50' => '50',
		'100' => '100',
		'150' => '150',
		'200' => '200',
		'250' => '250',
		'300' => '300',
		'350' => '350',
		'400' => '400',
		'450' => '450',
		'500' => '500',
	);
} else if ($Game_ID == 3) {
	$slot_ = array(
		'50' => '50 / 1 GB RAM',
		'100'=> '100 / 2 GB RAM',
		'150'=>'150 / 3 GB RAM',
		'200'=> '200 / 4 GB RAM',
		'250'=> '250 / 5 GB RAM',
		'300'=> '300 / 6 GB RAM',
		'350'=> '350 / 7 GB RAM',
		'400'=> '400 / 8 GB RAM',
	);
} else if ($Game_ID == 4) {
	$slot_ = array(
		'0' => '0',
	);
} else if ($Game_ID == 5) {
	$slot_ = array(
		'0' => '0',
	);
} else if ($Game_ID == 6) {
	$slot_ = array(
		'50' => '50',
		'100' => '100',
		'150' => '150',
		'200' => '200',
		'250' => '250',
		'300' => '300',
		'350' => '350',
		'400' => '400',
		'450' => '450',
		'500' => '500',
	);
} else if ($Game_ID == 7) {
	$slot_ = array(
		'12' => '12',
		'14' => '14',
		'16' => '16',
		'18' => '18',
		'20' => '20',
		'22' => '22',
		'24' => '24',
		'26' => '26',
		'28' => '28',
		'30' => '30',
		'32' => '32',
		'34' => '34',
		'36' => '36',
		'38' => '38',
		'40' => '40',
		'42' => '42',
		'44' => '44',
		'46' => '46',
		'48' => '48',
		'50' => '50',
		'52' => '52',
		'54' => '54',
		'56' => '56',
		'58' => '58',
		'60' => '60',
		'62' => '62',
		'64' => '64',
	);
} else if ($Game_ID == 8) {
	$slot_ = array(
		'0' => '0',
	);
} else if ($Game_ID == 9) {
	$slot_ = array(
		'0' => '0',
	);
} else if ($Game_ID == 10) {
	$slot_ = array(
		'2'=> '2',
		'4' => '4',
		'6' => '6',
		'8' => '8',
		'10' => '10',
		'12' => '12',
		'14' => '14',
		'16' => '16',
		'18' => '18',
	);
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
		<!-- GP SUPPORT -->
		<div id="ServerBox">
	        <div id="server_info_menu">
	            <div class="sNav">
	                <li><a href="/gp-home.php">Vesti</a></li>
	                <li><a href="/gp-servers.php">Serveri</a></li>
	                <li class="nav_s_active"><a href="/gp-billing.php">Billing</a></li>
	                <li><a href="/gp-support.php">Podrška</a></li>
	                <li><a href="/gp-settings.php">Podešavanja</a></li>
	                <li><a href="/gp-iplog.php">IP Log</a></li>
	                <li><a href="/logout.php">Logout</a></li> 
	            </div>
	        </div>

	        <div id="server_info_infor">    
	            <div id="server_info_infor">
	                <div id="server_info_infor2">
	                    <div class="space" style="margin-top: 20px;"></div>
	                    <div class="gp-home">
	                    	<?php if (isset($_GET['naruci'])) { ?>

	                    	<img src="/assets/img/icon/gp/gp-server.png" alt="" style="position:absolute;margin-left:20px;">
                        	<h2>NARUCITE SERVER</h2>
                        	<h3 style="font-size: 12px;">
	                            Ovde možete naruciti vas server. 
	                        </h3>
                        	
                        	
	                        <div class="space" style="margin-top: 60px;"></div> 
							
	                       	<!-- NARUCI SERVER -->

	                       	<form action="naruci.php" method="GET" autocomplete="off" id="naruci">
	                       		<input type="hidden" name="naruci" value="naruci">
								<div class="add_server_by_client_box">
									<label>Izaberite igru: </label>
									<select name="game" id="game" onchange="this.form.submit()">
										<option value="0" disabled selected="selected">Izaberi</option>
										<?php foreach ($game_ as $game_key => $game_val) { ?>
											<?php 
											if($Game_ID == $game_key) {
												$get_s_game = 'selected="selected"';
											} else {
												$get_s_game = '';
											} ?>
											<option <?php echo $get_s_game; ?> value="<?php echo $game_key; ?>"><?php echo $game_val; ?></option>
										<?php } ?>
									</select>
								</div>									
							</form>
							
							<form action="/fnc/buy.php?task=buy" method="POST" autocomplete="off">
								<input type="hidden" name="naruci" value="naruci">
								<input type="hidden" name="game_id" value="<?php echo $Game_ID; ?>">
								
								<div class="add_server_by_client">
									<label for="klijent">Ime i prezime: </label>
									<input name="ime" type="text" placeholder="Ime i prezime" required="">
								</div>
								
								<div class="add_server_by_client">
									<label for="klijent">Email: </label>
									<input name="email" type="email" placeholder="Email" required="">
								</div>
								
								<div class="add_server_by_client">
									<label for="klijent">Ime servera: </label>
									<input name="naziv" type="text" placeholder="Ime servera" required="">
								</div>
								<?php
								if (isset($_GET['game']) && $Game_ID != 11) {
								?>
								<div class="add_server_by_client">
									<label for="klijent">Lokacija: </label>
									<select name="lokacija" id="lokacija" onchange="set_money()">
										<option value="" disabled selected="selected">Izaberi</option>
										<?php foreach ($location_ as $loc_key => $loc_val) { ?>
											<option value="<?php echo $loc_key; ?>"><?php echo $loc_val; ?></option>
										<?php } ?>
									</select>
								</div>
								<div class="add_server_by_client">
									<label for="klijent"><?php
									if (isset($_GET['game'])) {
										if ($Game_ID == 10) {
											echo "Broj Botova";
										} else {
											echo "Slotovi";
										}
									} else {
										echo "Slotovi";
									}
								?>: </label>
									<select name="slotovi" id="slot" onchange="set_money()">
										<option value="" disabled selected="selected">Izaberi</option>
										<?php foreach ($slot_ as $slot_key => $slot_val) { ?>
											<option value="<?php echo $slot_key; ?>"><?php echo $slot_val; ?></option>
										<?php } ?>
									</select>
								</div>
								<?php } ?>
								<div class="add_server_by_client">
									<label for="mjeseci">Meseci: </label>
									<select name="mjeseci" id="mjeseci" onchange="set_money()">
										<option value="" disabled selected="selected">Izaberi</option>
										<option value="1">1 mesec</option>
									</select>
								</div>
								
								<div class="add_server_by_client">
									<label for="nacinplacanja">Nacin placanja: </label>
									<select name="nacinplacanja" id="nacinplacanja">
										<option value="" disabled selected="selected">Izaberi</option>
										<option value='Bank/Posta'>Banka/Posta</option>
										<option value='PayPal'>PayPal</option>
										<option value='SMS'>SMS</option>
									</select>
								</div>
								<?php
								if (isset($_GET['game']) && $Game_ID != 11) {
								?>
								<div class="add_server_by_client">
									<label for="klijent">Mod: </label>

									<?php if (!isset($_GET['game'])) { ?>
										<select name="mod" id="cs_def">
											<option value="" disabled selected="selected">Igra nije odabrana</option>
										</select>
									<?php } else if ($Game_ID == 1) { ?>
										<select name="mod" id="cs_mod">
											<option value="" disabled selected="selected">Izaberite mod</option>
											<?php $get_cs_mod = mysql_query("SELECT * FROM `modovi` WHERE `igra` = '$Game_ID'");
											while ($row_cs_mod = mysql_fetch_array($get_cs_mod)) { ?>
												<option value="<?php echo $row_cs_mod['id']; ?>">
													<?php echo $row_cs_mod['ime']; ?>
												</option>
											<?php } ?>
										</select>
									<?php } else if ($Game_ID == 2) { ?>
										<select name="mod" id="samp_mod">
											<option value="" disabled selected="selected">Izaberite mod</option>
											<?php $get_samp_mod = mysql_query("SELECT * FROM `modovi` WHERE `igra` = '$Game_ID'");
											while ($row_samp_mod = mysql_fetch_array($get_samp_mod)) { ?>
												<option value="<?php echo $row_samp_mod['id']; ?>">
													<?php echo $row_samp_mod['ime']; ?>
												</option>
											<?php } ?>	
										</select>
									<?php } else if ($Game_ID == 3) { ?>
										<select name="mod" id="mc_mod">
											<option value="" disabled selected="selected">Izaberite mod</option>
											<?php $get_mc_mod = mysql_query("SELECT * FROM `modovi` WHERE `igra` = '$Game_ID'");
											while ($row_mc_mod = mysql_fetch_array($get_mc_mod)) { ?>
												<option value="<?php echo $row_mc_mod['id']; ?>">
													<?php echo $row_mc_mod['ime']; ?>
												</option>
											<?php } ?>	
										</select>
									<?php } else if ($Game_ID == 6) { ?>
										<select name="mod" id="ts_mod">
											<option value="0" disabled selected="selected">Default</option>
										</select>
									<?php } else if ($Game_ID == 10) { ?>
										<select name="mod" id="sinus_mod">
											<option value="0" disabled selected="selected">Default</option>
										</select>
									<?php } ?>
								</div>
								<?php } ?>
								<div class="add_server_by_client">
									<label for="klijent">Cena: </label>
									<input type="hidden" name="cena" id="cena_input" value="">
									<span class="plava_color">
										<strong class="cena_pord" id="cena">0 &euro;</strong>
									</span>
								</div>
								
								<div class="space" style="margin-top:10px;"></div>

								<button class="right add_server_by_client_btn" type="submit"> 
									<i class="fa fa-cart-plus"></i> Naruci server
								</button>					
							</form>
							<?php } else if (isset($_GET['zahtev_za_dizanje'])) {
								header('Location:gp-billing.php');
								die();
							} else { ?>
								<img src="/assets/img/icon/gp/gp-config.png" alt="" style="position:absolute;margin-left:10px;">
	                        	<h2>IZABERITE</h2>
	                        	<h3 style="font-size: 12px;">
		                            Vec imate narucen server, ukoliko zelite da platite i podignete taj server idite na Zahtev za dizanje.
		                            <br />
		                            Ukoliko zelite da narucite jos jedan server idite na Naruci server.
		                        </h3>
	                        	
	                        	<div class="supportAkcija right">
		                            <li>
		                            	<a href="/gp-billing.php" class="lock-btn btn">
		                            		<i class="fa fa-shopping-cart"></i> BILLING
							

		                                   </a>
		                            </li>
		                        </div>

		                        <div class="space" style="margin-top: 50px;"></div>

								<button onclick="location.href='naruci.php?naruci';" class="btn btn-info btn-large btn-block" style="width: 49%; display:inline;"><i class="fa fa-gamepad"></i> Naruči server</button>
								<button onclick="location.href='gp-billing.php';" class="btn btn-success btn-large btn-block" style="width: 48%; margin-left: 20px; margin-top: 0px; display:inline;"><i class="fa fa-credit-card"></i> Zahtev za dizanje</button>			
							</div>

							<?php } ?>

							<div class="space clear"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>

	    <div class="space" style="margin-top: 40px;"></div>

	<!-- end containerr -->
	</div>
	<?php 
	include('style/footer.php');
	include('style/java.php');
	?>
    <script>
		function set_money() {
			var game_id_ 	= $('option:selected', '#game').val();
			
			if (game_id_ == 11) {
				var slot 		= 1;
				var Izdvajanje 	= 1;
			} else {
				var slot 		= $('option:selected', '#slot').val();
				var Izdvajanje 	= $('#lokacija').val();
			}
			
			if(Izdvajanje == '1'||Izdvajanje == '2'||Izdvajanje == '3') {
				if (game_id_ == 1) {
					//cs 1.6
					cn_sl = '0.375'; //Lite
				} else if (game_id_ == 2) {
					//samp
					cn_sl = '0.06'; //Lite
				} else if (game_id_ == 3) {
					//mc
					cn_sl = '0.06'; //Lite
				} else if (game_id_ == 4) {
					//cod2
					cn_sl = '0.09'; //Lite
				} else if (game_id_ == 5) {
					//cod4
					cn_sl = '0.09'; //Lite
				} else if (game_id_ == 6) {
					//ts3
					cn_sl = '0.06'; //Lite
				} else if (game_id_ == 7) {
					//cs:go
					cn_sl = '0.09'; //Lite
				} else if (game_id_ == 8) {
					//mta
					cn_sl = '0.09'; //Lite
				} else if (game_id_ == 9) {
					//ark
					cn_sl = '0.09'; //Lite
				} else if (game_id_ == 10) {
					//SinusBot
					cn_sl = '1'; //Lite
				} else if (game_id_ == 11) {
					//FastDL
					cn_sl = '2'; //Lite
				}

				var Izdvajanjep = cn_sl;
			} else if(Izdvajanje == '4'||Izdvajanje == '5') {
				if (game_id_ == 1) {
					//cs 1.6
					cn_sl = '0.50'; //Premium
				} else if (game_id_ == 2) {
					//samp
					cn_sl = '0.09'; //Premium
				} else if (game_id_ == 3) {
					//mc
					cn_sl = '0.09'; //Premium
				} else if (game_id_ == 4) {
					//cod2
					cn_sl = '0.09'; //Premium
				} else if (game_id_ == 5) {
					//cod4
					cn_sl = '0.09'; //Premium
				} else if (game_id_ == 6) {
					//ts3
					cn_sl = '0.09'; //Premium
				} else if (game_id_ == 7) {
					//cs:go
					cn_sl = '0.09'; //Premium
				} else if (game_id_ == 8) {
					//mta
					cn_sl = '0.09'; //Premium
				} else if (game_id_ == 9) {
					//ark
					cn_sl = '0.09'; //Premium
				} else if (game_id_ == 10) {
					//SinusBot
					cn_sl = '1'; //Premium
				} else if (game_id_ == 11) {
					//FastDL
					cn_sl = '2'; //Premium
				}
				
				var Izdvajanjep = cn_sl;
			} else {
				Izdvajanje = 0;
			}
			var CenaSlota = Izdvajanjep;
			var Cena = slot;
			Cena *= CenaSlota;
			Cena = Cena.toFixed(2);
			var cena_valuta_zemlja = Cena+" €";

			if (Izdvajanje == '') {
				cena_valuta_zemlja = 'Izaberite lokaciju';
			} else {
				if(!(slot > 0)) {
					cena_valuta_zemlja = 'Izaberite broj slotova';
				}
			}
			
			$('#cena').html(cena_valuta_zemlja);
			$('#cena_input').val(cena_valuta_zemlja);
		}
	</script>

</body>
</html>