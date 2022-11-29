<?php
include_once("connect_db.php");
header('Content-Type: charset=UTF-8');

$masine = mysql_num_rows(mysql_query("SELECT * FROM `box`"));
$serveri = mysql_num_rows(mysql_query("SELECT * FROM `serveri` WHERE `startovan` = 1"));
$serveri_other = mysql_num_rows(mysql_query("SELECT * FROM `serveri` WHERE `igra` = 6 OR `igra` = 7"));
$serveri = ($serveri + $serveri_other);

?>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/css2/main.css?<?php echo time(); ?>">
    <link rel="stylesheet" type="text/css" href="/css2/mobile.css?<?php echo time(); ?>">
	<link rel="stylesheet" type="text/css" href="/assets/fontawesome/css/all.css">
	<link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/assets/css2/spoksy.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/assets/owl.theme.default.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/assets/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="/assets/css2/animate.css">
	<link href="https://fonts.googleapis.com/css?family=Titillium+Web:300,400,600,700,900" rel="stylesheet">
	
<html lang="sr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./css2/spoksy.css">
<link rel="stylesheet" type="text/css" href="./css/spoksy.css">


<link rel="stylesheet" type="text/css" href="./css2/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./css2/main.css">
<link rel="stylesheet" type="text/css" href="./css2/style.css">

<?php include('style/head2.php'); ?>
<body onload="slider_fnc_hide_img()">
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-6727414877019609",
          enable_page_level_ads: true
     });
</script>

	<!-- Error script -->
	<?php include('style/err_script.php'); ?>
	
	<!-- HEADER BOX -->

	<?php include('style/header.php'); ?>



	<!-- NAV BOX -->

	<?php include('style/navigacija.php'); ?>
		<!-- LOGIN BOX --> 
		<div class="containerr">
	<?php include('style/login_provera2.php'); ?>
	
	<div class="wlcslide_spoksy">
		
		<span class="wlctitle_spoksy">
			Emax Community 
		</span><br>
		<span class="wlcdesc_spoksy">	
		Dobrodosli na zvanicni sajt Emax zajednice <br>
		Registrujte se i zabavite sa ostalim <br>
		korisnicima nase zajednice!<br> <br>

		Zelimo vam ugodan boravak na sajtu!
		</span>	
		
	</div>
	<!-- SLIDER -->
<br />
	<!--	 <div id="slider_kevia">
			<div class="slider_kevia">
				<div class="slider_kevia_img left">
					<div class="slider_img1">
						<a href="/home">
							<img class="slider_img" src="/assets/img/icon/slider/1.png" style="width:550px;height:280px;">
						</a>
					</div>

					<div class="slider_img2">
						<a href="//gametracker.pw" target="_blank">
							<img class="slider_img" src="/assets/img/icon/slider/2.png" style="width:550px;height:280px;">
						</a>
					</div>

					<div class="slider_img3">
						<a href="//creativbox.me" target="_blank">
							<img class="slider_img" src="/assets/img/icon/slider/3.png" style="width:550px;height:280px;">
						</a>
					</div>

					<div class="slider_img4">
						<a href="//webcloud.pro" target="_blank">
							<img class="slider_img" src="/assets/img/icon/slider/4.png" style="width:550px;height:280px;">
						</a>
					</div>
				</div>

				<div class="slider_kevia_button">
					<div class="sl_button_li sl_button_li_act slider_button1">
						<li>
							<a onclick="change_img(1)" style="margin-top:-25px;position:absolute;">
								<img class="slider_img_str" src="/assets/img/icon/slider/str1.png">
							</a>
						</li>
						<li>
							<a onclick="change_img(1)">
								<p>
									<strong style="font-size:12px;">e-max.rs</strong> <br>
									Lorem ipsum dolor sit amet, <br> consectetur adipisicing...
								</p>
							</a>
						</li>
					</div>

					<div class="sl_button_li slider_button2">
						<li>
							<a onclick="change_img(2)" style="margin-top:-25px;position:absolute;">
								<img class="slider_img_str" src="/assets/img/icon/slider/str1.png">
							</a>
						</li>
						<li>
							<a onclick="change_img(2)">
								<p>
									<strong style="font-size:12px;">GameTracker.pw</strong> <br>
									Lorem ipsum dolor sit amet, <br> consectetur adipisicing...
								</p>
							</a>
						</li>
					</div>

					<div class="sl_button_li slider_button3">
						<li>
							<a onclick="change_img(3)" style="margin-top:-25px;position:absolute;">
								<img class="slider_img_str" src="/assets/img/icon/slider/str1.png">
							</a>
						</li>
						<li>
							<a onclick="change_img(3)">
								<p>
									<strong style="font-size:12px;">CreativBox.me</strong> <br>
									Lorem ipsum dolor sit amet, <br> consectetur adipisicing...
								</p>
							</a>
						</li>
					</div>

					<div class="sl_button_li slider_button4">
						<li>
							<a onclick="change_img(4)" style="margin-top:-25px;position:absolute;">
								<img class="slider_img_str" src="/assets/img/icon/slider/str1.png">
							</a>
						</li>
						<li>
							<a onclick="change_img(4)">
								<p>
									<strong style="font-size:12px;">WebCloud.pro</strong> <br>
									Lorem ipsum dolor sit amet, <br> consectetur adipisicing...
								</p>
							</a>
						</li>
					</div>
				</div>

				<div class="slider_kevia_str_dwn">
					<div class="slider_kevia_str_hr">
						<div class="slider_str_dwn_li slider_img_str1">
							<li>
								<a id="change_img_str1" onclick="change_img(1)">
									<img src="/assets/img/icon/slider/str_down_act.png">
								</a>
							</li>
						</div>

						<div class="slider_str_dwn_li slider_img_str2">
							<li>
								<a id="change_img_str2" onclick="change_img(2)">
									<img src="/assets/img/icon/slider/str_down.png">
								</a>
							</li>
						</div>

						<div class="slider_str_dwn_li slider_img_str3">
							<li>
								<a id="change_img_str3" onclick="change_img(3)">
									<img src="/assets/img/icon/slider/str_down.png">
								</a>
							</li>
						</div>

						<div class="slider_str_dwn_li slider_img_str4">
							<li>
								<a id="change_img_str4" onclick="change_img(4)">
									<img src="/assets/img/icon/slider/str_down.png">
								</a>
							</li>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		<div id="nasi_srv">
	
	<table class="nsrv" cellspacing="0">
		
						
		<tbody><tr><td><img src="/img/icon/gp/game/cs.ico" style="width:12px; height:12px;"> <img src="/img/icon/country/RS.png" style=" height:12px;"> <a href="#">e-max.rs GvsD dd2 Only ( Premium )</a> </td> 
			
						
		<td><img src="/img/icon/gp/game/csgo.jpg" style="width:12px; height:12px;"> <img src="/img/icon/country/DE.png" style=" height:12px;"> <a href="#">e-max.rs Public</a> </td> 
			
		<td><img src="/img/icon/gp/game/mc.png" style="width:12px; height:12px;"> <img src="/img/icon/country/DE.png" style=" height:12px;"> <a href="#">mc.e-max.rs</a> </td> 
		<td><img src="/img/icon/gp/game/spoksy_ts3.png" style="width:12px; height:12px;"> <img src="/img/icon/country/FR.png" style=" height:12px;"> <a href="#">ts.e-max.rs | United Media - SPORTKLUB Official Public Server</a> </td> 

</tr></tbody></table>
</div>
<br>

<div id="bb">
	<div class="wlcslide">
		
		<span class="wlctitle">
			Emax Community 
		</span><br>
		<span class="wlcdesc">	
		Dobrodosli na zvanicni sajt Emax zajednice <br>
		Registrujte se i zabavite sa ostalim <br>
		korisnicima nase zajednice!<br> <br>

		Zelimo vam ugodan boravak na sajtu!
		</span>	
		
	</div>
	
	
	<div id="randomsrv">
		
		Posetite nas na:
		

		<br><br>
		
		 
		
		<img src="http://image.www.gametracker.com/images/maps/160x120/cs/de_dust.jpg">
	
		
		<div class="ri">
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  e-max.rs GvsD<br><br>
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  Mod: <span class="zuto">  Public </span> <br><br>
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  Online: <span class="zuto"> Da </span> <br><br>
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  Trenutno igraca: <span class="zuto"> 31/32 </span> <br>	<br>	
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  Ip: <span class="zuto"> 176.36.152.23:27015 </span> <br>		

		</div>
		
		<span class="trenutna_mapa">Trenutna mapa: <span class="zuto">de_dust2</span></span>
		
		
		
				
		
		<br>
	</div>
	</div>
	<br><br>

		<!-- SPOKSY BANNER -->

		
		<!-- STATISTIKA -->

		<div id="gh_stats">
			<div class="gh_stats">
				
				
				<div class="gh_stats_content">
					<div class="gh_stats_srv" style="text-align:center;">
						   <br />
						
						   <div class="gh_stats_srv_okvir1">
						   <img src="/assets/img/icon/stats_txt1.png">

							<div class="gh_stats_text1">
								<p><?php echo $serveri; ?></p>
							</div>
	                     </div>
		             </div>
		         </div>
		     </div>
		 </div>
		 
		 <div id="gh_stats-1">
			<div class="gh_stats-1">
				
				
				<div class="gh_stats_content-1">
					<div class="gh_stats_srv" style="text-align:center;">
						   <br />
						
						   <div class="gh_stats_srv_okvir2">
						   <img src="/assets/img/icon/stats_txt2.png">

							<div class="gh_stats_text2">
								<p><?php echo $masine; ?></p>
							</div>
	                     </div>
		             </div>
		         </div>
		     </div>
		 </div>
		 
		 

		<div id="gh_stats-2">
			<div class="gh_stats-2">
				
				
				<div class="gh_stats_content-2">
					<div class="gh_stats_srv" style="text-align:center;">
						   <br />
						
						   <div class="gh_stats_srv_okvir1">
						   <img src="/assets/img/icon/stats_txt1.png">

							<div class="gh_stats_text1">
								<p><?php echo $serveri; ?></p>
							</div>
	                     </div>
		             </div>
		         </div>
		     </div>
		 </div>
		 
		 <div id="gh_stats-3">
			<div class="gh_stats-3">
				
				
				<div class="gh_stats_content-3">
					<div class="gh_stats_srv" style="text-align:center;">
						   <br />
						
						   <div class="gh_stats_srv_okvir2">
						   <img src="/assets/img/icon/stats_txt2.png">

							<div class="gh_stats_text2">
								<p><?php echo $masine; ?></p>
							</div>
	                     </div>
		             </div>
		         </div>
		     </div>
		 </div>
		 
		 <div id="gh_stats-4">
			<div class="gh_stats-4">
				
				
				<div class="gh_stats_content-4">
					<div class="gh_stats_srv" style="text-align:center;">
						   <br />
						
						   <div class="gh_stats_srv_okvir2">
						   <img src="/assets/img/icon/stats_txt2.png">

							<div class="gh_stats_text2">
								<p><?php echo $masine; ?></p>
							</div>
	                     </div>
		             </div>
		         </div>
		     </div>
	     </div>

		 <div id="gh_stats-5">
			<div class="gh_stats-5">
				
				
				<div class="gh_stats_content-5">
					<div class="gh_stats_srv" style="text-align:center;">
						   <br />
						
						   <div class="gh_stats_srv_okvir2">
						   <img src="/assets/img/icon/stats_txt2.png">

							<div class="gh_stats_text2">
								<p><?php echo $masine; ?></p>
							</div>
	                     </div>
		             </div>
		         </div>
		     </div>
	     </div>
		 <div id="gh_stats-6">
			<div class="gh_stats-6">
				
				
				<div class="gh_stats_content-6">
					<div class="gh_stats_srv" style="text-align:center;">
						   <br />
						
						   <div class="gh_stats_srv_okvir2">
						   <img src="/assets/img/icon/stats_txt2.png">

							<div class="gh_stats_text2">
								<p><?php echo $masine; ?></p>
							</div>
	                     </div>
		             </div>
		         </div>
		     </div>
		 </div>

		 <div id="gh_stats-7">
			<div class="gh_stats-7">

		 <div class="gh_stats_content-7">
					<div class="gh_stats_srv" style="text-align:center;">
						   <br />
						
						   <div class="gh_stats_srv_okvir2">
						   <img src="/assets/img/icon/stats_txt2.png">

							<div class="gh_stats_text2">
								<p><?php echo $masine; ?></p>
							</div>
	                     </div>
		             </div>
		         </div>
		     </div>
	     </div>
		 <div id="add_banner"></div>
		 <div class="spoksy-text">
    <button>Dodaj</button>
  </div>
	<!-- BANER -->
	<?php include('style/banner.php'); ?>

	

	<!-- GAME BOX -->
	<?php include('style/game.php'); ?>

	<!-- BILTEN BOX -->

	<?php include('style/bilten.php'); ?>
	
	<!-- BANNER 2 BOX -->
	
	<div id="banner_last">
		<img src="/img/icon/banner_last.png">
	</div>

	<div class="space" style="margin-top: 20px;"></div>

	<!-- REKLAME BOX -->

	<?php include('style/reklama.php'); ?>

	<!-- izbrisi_email (POPUP)-->
    <div class="modal fade" id="edit-bilten" role="dialog">
        <div class="modal-dialog">
            <div id="popUP"> 
                <div class="popUP">
                    <?php
                        $get_pin_toket = $_SERVER['REMOTE_ADDR'].'_p_'.randomSifra(100);
                        $_SESSION['token'] = $get_pin_toket;
                    ?>
                    <form action="process.php?task=edit_bilten" method="post" class="ui-modal-form" id="modal-pin-auth">
                        <input type="hidden" name="token" value="<?php echo $get_pin_toket; ?>">
                        <fieldset>
                            <h2>Promena biltena</h2>
                            <ul>
                                <li>
                                    <p>Ovim cete onemoguciti dolazenje nasih obavestenja na vas email.</p>
                                    <p>Promenu vazda mozete promeniti!</p>
                                </li>
                                <li>
                                    <label>Email:</label>
                                    <input type="email" name="email" placeholder="Molimo unesite vas email." class="short">
                                </li>
                                <li style="text-align:center;">
                                    <button> <span class="fa fa-check-square-o"></span> Sacuvaj</button>
                                    <button type="button" data-dismiss="modal" loginClose="close"> <span class="fa fa-close"></span> Odustani </button>
                                </li>
                            </ul>
                        </fieldset>
                    </form>
                </div>        
            </div>  
        </div>
    </div>
    <!-- KRAJ - izbrisi_email (POPUP) -->
	
	<div class="space" style="margin-top: 30px;"></div>

    <!-- FOOTER -->
    </div>
    <?php include('style/footer.php'); ?>   

    <?php include('style/java.php'); ?>
</body>
</html>