<?php
include_once("connect_db.php");
header('Content-Type: charset=UTF-8');
$br = @file_get_contents('preuzimanja.txt');
$br = number_format($br, 0);
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

	<!-- SLAJDER I STATISTIKA -->


		
		
	->
<h3 id="zatamnicenovnik"><center>Counter Strike 1.6 Download </center></h3> 
<div class="space" style="margin-top: 20px;"></div>
<div id="cenovnik">
		<table border="0" align="center" >
			<tr align="center">				
				<th align></br>
							
							<p style="font-size:23pt;color:#dc0c11"> Counter Strike 1.6 - 2018</p>
							<p style="font-size:15pt;color:#dc0c11"> - About the Game - </p>
							<p class="font-size:8pt"> - Counter Strike 1.6 by e-Game Hosting - the project was created not so long ago, but already received the recognition of their players. With every passing day, we are wielding every effort to make it better. Our distinctive feature is that we try to take into account the opinions and wishes of our players. We focus on our experience and ability to create the best gaming servers Conter-Strike 1.6 </p>
							<p style="font-size:15pt;color:#dc0c11"> - Features - </p>
							
							<p class="big">
              				 
							 - Only 237MB setup size. <br>

							 

							 - 100% clean rip from Steam GCFs (Game cache files) <br>

							 - Includes latest CS 1.6 bots. <br>

							 - Dual Protocol (48 + 47) Client. <br>

							 - Working Dedicated and Listen server (Steam and non-Steam) <br>

							 - Working server browser with Internet, Favorite and LAN tabs. <br>

							 - Full protection against all types of slow hacking servers. <br>

							 - Compatible with latest sXe Injected anticheat! <br>

							 - Include latest Metamod-P v1.21p37! <br>

							 - Include latest AMX Mod X v1.8.2 (disabled by default)  <br>

							 - HLTV is also included and works! <br>

							 - Engine version (1.1.2.6 build 4554)  <br>

							 - Playable on Internet and LAN <br>

							 - Can be used as Portable <br>


						
						<a class="button" href="./cs_dll.php" target="_blank">DOWNLOAD Counter-Strike 1.6 - 2018 </a>
						</table>
								
			                                                       <center><div class="title_sidebar_monthly" style="background: url(http://i.pics.rs/B9Ir9.png) repeat-y; height: 60px; width: 319px; padding: 12px 0px 0px 15px;">
						 <center><div style="line-height: 65%; font-size: 25px; text-transform:uppercase; padding: 0px 0px 0px 0px;"><h7>Unique Downloads</h7></div><?php echo $br; ?></center>
						
					
						 		
	</div>
</article>
<!-- end containerr -->
	</div>
	<?php 
	include('style/footer.php');
	include('style/java.php');
	?>

