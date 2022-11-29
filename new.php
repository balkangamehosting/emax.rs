<?php 
include 'spoksy_process.php';
include 'q.php';
session_start();
include_once("connect_db.php");
header('Content-Type: charset=UTF-8');

if($_SESSION['userid'] == $_SESSION['userid']) {
	
	mysqli_query($con,"UPDATE `users` SET `last_activity` = unix_timestamp() WHERE `userid` = '$_SESSION[userid]'");
	mysqli_query($con,"UPDATE `users` SET `online` = 1 WHERE `last_activity` > unix_timestamp() - 30 AND `userid` = '$_SESSION[userid]'");	
	
}
	mysqli_query($con,"UPDATE `users` SET `online` = 0 WHERE `last_activity` < unix_timestamp() - 30");

?>
<!DOCTYPE html>
<html>
<head>
    <title>RBF Community v2</title>
    <meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/djoxi.css" />	
	<link rel="shortcut icon" href="includes/img/favicon.ico" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript" src="../popup.js"></script>	
	<link href='http://fonts.googleapis.com/css?family=Shadows+Into+Light' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Architects+Daughter' rel='stylesheet' type='text/css'>		
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css" />	
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>	
	
	
</head>

	<script>
	$(function(){

	var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");

		$('a[data-modal-id]').click(function(e) {
			e.preventDefault();
		$("body").append(appendthis);
		$(".modal-overlay").fadeTo(500, 0.7);
		//$(".js-modalbox").fadeIn(500);
			var modalBox = $(this).attr('data-modal-id');
			$('#'+modalBox).fadeIn($(this).data());
		});  
	  
	  
	$(".js-modal-close, .modal-overlay").click(function() {
		$(".modal-box, .modal-overlay").fadeOut(500, function() {
			$(".modal-overlay").remove();
		});
	 
	});
	 
	$(window).resize(function() {
		$(".modal-box").css({
			top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
			left: ($(window).width() - $(".modal-box").outerWidth()) / 2
		});
	});
	 
	$(window).resize();
	 
	});
	</script>


<body>

     <?php
     if(isset($_SESSION['ok'])){
	 $ok = $_SESSION['ok'];
	 echo "<div class='succ'><br /><p><center><font color='white'>$ok</font></center></p></div></div>";
	 unset($_SESSION['ok']);
     } else {}
     if(isset($_SESSION['error'])){
  	 $greske = $_SESSION['error'];
	 echo "
          <div class='error'><p><center><br /><font color='white'>$greske</font></center></p></div></div>";
	 unset($_SESSION['error']);
     } else {}
     ?>
<div id="header"></div>
<div id="omot">
<div class="header">Dobrodosli na <strong style="color:#ff9000;">RBF Community</strong>!</div>

<?php 
	if($_SESSION['userid'] == $_SESSION['userid']) {
		
		$user = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM users WHERE userid='$_SESSION[userid]'"));
		$rank = $user['rank'];
		
		if($rank == "1") {

?>
	
	<div id="admin-menu">
	
	Admin menu:
	<a href="/serveriadmin">Serveri</a>
	<a href="/novostiadmin">Novosti</a>	
	</div>
	
<?php }}; ?>


<div id="logo"><a href="/index.php"><img src="/img/logo.png"></a></div>

<div id="nav">

	<div class="navi">
		
		<a class="nav_home" href="/index.php"></a>
		<a class="nav_serveri" href="/serveri"></a>
		<a class="nav_korisnici" href="/korisnici"></a>
		<?php if($_SESSION['userid'] == "") { ?>
		<a class="js-open-modal nav_registracija" href="#" data-modal-id="registracija"></a>
		<a class="js-open-modal nav_login" href="#" data-modal-id="login"></a>
		<?php } else { ?>
		<a class="nav_profil" href="/korisnik/<?php echo $_SESSION['userid']; ?>"></a>
		<a class="nav_odjavise" href="/logout.php"></a>
		<?php }; ?>
	</div>

</div>


<div id="nasi_srv">
	
	<table class="nsrv" cellspacing="0">
		
		<?php 
			
			$sql = "SELECT * FROM servers ORDER by id DESC limit 5";
			$q = mysqli_query($con,$sql);
			
			while($red = mysqli_fetch_array($q)) {
			
			$igra = $red['game'];
			$lokacija = $red['drzava'];
			
			$hostname = $red['hostname'];
			if(strlen($hostname) > 40){ 
			$hostname = substr($hostname,0,40); 
			$hostname .= "..."; 
			}			
			
			$ip = $red['ip'];
			$port = $red['port'];
			
		?>
				
		<td><img src="/img/igre/<?php echo $igra; ?>.gif" style="width:12px; height:12px;"> <img src="/img/lokacije/<?php echo $lokacija; ?>.png" style=" height:12px;"> <a href="/server_info/<?php echo "$ip:$port"; ?>"><?php echo $hostname; ?></a> </td> 
			
		<?php }; ?>
	</table>

</div>




		<?php
		define("access", 1);
		error_reporting(0);
		if($_GET['page'] == "server_info"){
		   include("server.php");
		}
		else
		if($_GET['page'] == "serveri") {
			include("servers.php");
		}
		else 
		if($_GET['page'] == "korisnik"){
   		include("korisnik.php");   	
   		}			   
		else 
		if($_GET['page'] == "serveriadmin"){
   		include("serveriadmin.php");   	
   		}  
		else 
		if($_GET['page'] == "korisnici"){
   		include("korisnici.php");   	
   		}  	
		else 
		if($_GET['page'] == "novostiadmin"){
   		include("novostiadmin.php");   	
   		}  
		else 
		if($_GET['page'] == "obavestenja"){
   		include("obavestenja.php");   	
   		}  		
   		else {
		?>
		
	<div id="bb">
	<div class="wlcslide">
		
		<span class="wlctitle">
			RBF Community 
		</span><br />
		<span class="wlcdesc">	
		Dobrodosli na zvanicni sajt RBF zajednice <br />
		Registrujte se i zabavite sa ostalim <br />
		korisnicima nase zajednice!<br /> <br />

		Zelimo vam ugodan boravak na sajtu!
		</span>	
		
	</div>
	
	
	<div id="randomsrv">
		
		Posetite nas na:
		

		<br /><br />
		
		<?php 
			
			$sql = "SELECT * FROM servers ORDER by rand() DESC LIMIT 1";
			$kveri = mysqli_query($con,$sql);
			
			while ($red = mysqli_fetch_array($kveri)) {
				
				$ip = $red['ip'];
				$port = $red['port'];
				
				$mapa = $red['mapa'];
				$mod = $red['mod'];
				
				$hostname = $red['hostname'];
				if(strlen($hostname) > 20){ 
				$hostname = substr($hostname,0,20); 
				$hostname .= "..."; 
			}				
			
			$online = $red['status'];
			
			if($online == "1") {
				
				$online = "Da";
				
			} else 
			if($online = "0") {
				
				$online = "Ne";
				
			}
			
			$br_igraca = $red['broj_igraca'];
			$max_igraca = $red['max_igraca'];
			
		?> 
		
		<img src="http://image.www.gametracker.com/images/maps/160x120/cs/de_dust.jpg">
	
		
		<div class="ri">
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  <?php echo $hostname; ?><br /><br />
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  Mod: <span class="zuto">  <?php echo $mod; ?> </span> <br /><br />
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  Online: <span class="zuto"> <?php echo $online; ?> </span> <br /><br />
		<img class="ii" src="/img/infoicon.png"><span style="margin-left:5px;"></span>  Trenutno igraca: <span class="zuto"> <?php echo "$br_igraca/$max_igraca"; ?> </span> <br />		
		</div>
		
		<span class="trenutna_mapa">Trenutna mapa: <span class="zuto"><?php echo $mapa; ?></span></span>
		
		<br />
		
		<a  href="/server_info/<?php echo "$ip:$port"; ?>">INFO SERVERA</a>
		
		<?php }; ?>
		
		
		<br />
	</div>
	</div>
	<div id="vo">
		
		<div id="mecevi-title">
			NOVI KORISNICI <span style="margin-left:135px;"><a class="zuto" href="/korisnici">SVI KORISNICI</a></span>
		</div><br /><br /><br />
		
		<div class="tmec">	
		
		<?php 
			
			$sql = "SELECT * FROM users ORDER by userid DESC LIMIT 3";
			$q = mysqli_query($con,$sql);
			$provera = mysqli_num_rows(mysqli_query($con,"SELECT userid FROM users"));

		?>
		<?php if($provera < 1) { ?>
			
		<div class="mec">
			Trenutno nema korisnika
		</div>
		<br /> <br /><br />
			
		<?php };?>
		<?php 
			
			while($red = mysqli_fetch_array($q)) {
			
			
			
		?>
	
	
		<div class="mec">
			<span class="mec-title">
			<img src="/avatari/<?php echo $red['avatar']; ?>" style="width:20px; height:20px;"> 
				<span style="margin-top:5px;margin-left:4px; position:absolute;"><a class="zuto" href="/korisnik/<?php echo $red['userid']; ?>"><?php echo $red['username']; ?></a></span>	
		</div>
		<br /> <br /><br />
		
		<?php };?>
	
	</div>

		<div id="novosti">
			
				
			<?php 
				
				
				$provera = mysqli_num_rows(mysqli_query($con,"SELECT id FROM obavestenja"));
				
				if($provera < 1) {
					
					echo "Trenutno nema obavestenja!";
					
				}
			
			?>
			
			<?php 
				
				$sql = "SELECT * FROM obavestenja ORDER by id DESC";
				$kveri = mysqli_query($con,$sql);
				
				while($red = mysqli_fetch_array($kveri)){ 
				
				$obavestenje_naziv = $red['naziv'];
				if(strlen($obavestenje_naziv) > 40){ 
				$obavestenje_naziv = substr($obavestenje_naziv,0,40); 
				$obavestenje_naziv .= "..."; 

				}					

				$obavestenje_sadrzaj = $red['sadrzaj'];
				if(strlen($obavestenje_sadrzaj) > 220){ 
				$obavestenje_sadrzaj = substr($obavestenje_sadrzaj,0,220); 
				$obavestenje_sadrzaj .= "..."; 
			}		

				
			?>
				
				
				<span class="zuto"><?php echo $red['id']; ?># <?php echo $obavestenje_naziv; ?></span>
				<br /> <br />
				<?php echo nl2br($obavestenje_sadrzaj); ?>
				
	
				<br /> 
				
					
				
				<a class="js-open-modal btn" href="#" data-modal-id="<?php echo $red['id']; ?>">PROCITAJ</a> <br /><br />
				
				<hr />


		
		
		<div id="<?php echo $red['id']; ?>" class="modal-box" style="width:800px;margin-top:-250px;">
		  <header> 
			<h3><?php echo $obavestenje_naziv; ?></h3>
		  </header>
		  <div class="modal-body">

			
			<?php echo nl2br($red['sadrzaj']); ?>
		  
		  
		  
		  
		  </div>
			<a href="#" class="btn-small js-modal-close" style="margin-left:730px;">Zatvori</a> 
		<br /><br />
		</div>	
		
		
		
				
			<?php };?>	
				
		</div>
	
			
			
			
	
		
	</div>


		<?php };?>

		<div id="footer">
			
			<div class="black">
				<span class="zuto">
					KORISNI LINKOVI
				</span>
				<br /><br />
				
				<a href="/index.php">Pocetna</a>
				<br />
				<a href="/serveri">Serveri</a>
				<br />				
				<a href="/korisnici">Korisnici</a>
				<br />				
				<a href="/obavestenja">Obavestenja</a>
				<br /><br />			
		
				
				<div class="onama">
				<span class="zuto">
					OSTALI O NASOJ ZAJEDINICI:
				</span>
				
				<br /><br />
				<div class="okvir">
		
					<div class="komentar">
						<?php 
							
							$provera = mysqli_num_rows(mysqli_query($con,"SELECT * FROM komentari"));
							
							if($provera < 1) {
								
								echo "Nema komentara...";
								
							} else {
								
								$sql = "SELECT * FROM komentari order by rand() LIMIT 1";
								$kveri = mysqli_query($con,$sql);
								
								while($red = mysqli_fetch_array($kveri)) {
								
								$komentar = $red['komentar'];
								if(strlen($komentar) > 70){ 
								$komentar = substr($komentar,0,70); 
								$komentar .= "..."; 
							}								
						
								$username = $red['username'];
								if(strlen($username) > 15){ 
								$username = substr($username,0,15); 
								$username .= "..."; 
							}								
												
						?>
							
							<?php echo $komentar; ?>
							
							<br /><br />
							
							by:<strong><a class="zuto" href="/korisnik/<?php echo $red['userid']; ?>"><?php echo $username; ?></a></strong>
							
							<?php 
								
								if(strlen($komentar) > 70){ 
									
							?>
							
							
							<a class="js-open-modal btn" href="#" data-modal-id="komentar-<?php echo $red['id']; ?>">Procitaj ceo komentar</a>
							
							
							

						<div id="kom-popup">
						<div id="komentar-<?php echo $red['id']; ?>" class="modal-box" style="width:800px;margin-top:-250px;">
						  <header> 
							<h3>Citate komentar korisnika <strong class="zuto"><?php echo $red['username']; ?></strong></h3>
						  </header>
						  <div class="modal-body">

							
							<?php echo nl2br($red['komentar']); ?>
						  
						  
						  
						  
						  </div>
							<a href="#" class="btn-small js-modal-close" style="margin-left:730px;">Zatvori</a> 
						
						<br /><br />
						</div>								
						</div>
							
							<?php };?>
						
							<?php }};?>
					</div>
				
					
				
				</div>
				
				<?php if($_SESSION['userid'] == $_SESSION['userid']) { 
				
				$user = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM users WHERE userid='$_SESSION[userid]'"));
				
				?>
				
				<div class="dodajkom">
					<?php if($_SESSION['userid'] = $_SESSION['userid']) { ?><a class="js-open-modal" href="#" data-modal-id="dodaj_kom">Dodajte komentar</a> <?php };?>
				</div>
				
						<div id="kom-popup">
						<div id="dodaj_kom" class="modal-box" style="width:800px;margin-top:-250px;">
						  <header> 
							<h3>Dodajte novi komentar</h3>
						  </header>
						  <div class="modal-body">

						<?php 
							
								if(isset($_POST['dodajkom'])) {
									
								$kom = htmlspecialchars(mysqli_real_escape_string($con,$_POST['kom']));
								$username = $user['username'];
								$userid = $_SESSION['userid'];
							
								$sql = "INSERT into komentari(`komentar`,`userid`,`username`) VALUES('$kom','$userid','$username')";
								$q = mysqli_query($con,$sql);
								
								if($q == ""){
									
									$_SESSION['error'] = "Greska";
									header("Location:/index.php");
								}
								if(!$q){
									
									$_SESSION['error'] = "Greska";
									header("Location:/index.php");
								}	
								else {
									
									$_SESSION['ok'] = "Uspesno";
									header("Location:/index.php");	
									
								}
								
							}
						  
						?>
						  
							
							<form action="" method="POST">
								
								<textarea type="text" name="kom" class="djoxi" style="width:750px; height:100px;" placeholder="Vas komentar.."></textarea>
								
								<br />
								
								<input type="submit" name="dodajkom" class="login_btn" value="Dodaj komentar">
								
							</form>
						  
						  
						  
						  
						  </div>
							<a href="#" class="btn-small js-modal-close" style="margin-left:730px;">Zatvori</a> 
						
						<br /><br />
						</div>								
						</div>				
				
				
				<?php };?>
				
			</div>
				

				<div class="about">
				<span class="zuto">
					ONO STO BI TREBALO DA ZNATE
				</span>
			
				
				<br /><br />
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
		
				</div>
				<br /><br /><br /><br />
				
				
				
				
			</div>
		
			
			
		</div>
		
	<br /> <br />
		
		
</div> 
	

		<div class="footer">
		<center>
		Copyright 2015 &copy <strong style="color:#ff9000;">RBF Community</strong> <br />
		
		Dizajner i koder: <a style="color:#ff9000; text-decoration:none;" href="https://www.facebook.com/Djordje-Radovanovic-Djoxi-285936344941972/">Djordje Radovanovic Djoxi</a>
		
		</center>
		</div>
			
</div> <!--  BB KRAJ -->

</body>
</html>



		<div id="login" class="modal-box" style="width:800px;">
		  <header> 
			<h3>Ulogujte se</h3>
		  </header>
		  <div class="modal-body">

			
					<form action="/spoksy_process.php?task=login" method="POST">
						<input type="text" name="username" class="djoxi" placeholder="Username..."></input><br /> <br />
						<input type="password" name="password" class="djoxi" placeholder="Password..."></input> <br /> <br />
						
						<input type="submit" name="login" class="login_btn" value="LOGIN"></input>
						
					</form>
		  
		  
		  
		  
		  </div>
			<a href="#" class="btn-small js-modal-close zatvori" style="margin-left:730px;">Zatvori</a> 
		<br /><br />
		</div>	


		<div id="registracija" class="modal-box" style="width:800px;">
		  <header> 
			<h3>Registrujte se</h3>
		  </header>
		  <div class="modal-body">

			
	<form action="/spoksy_process.php?task=registracija" method="POST">
		
		<label>Ime: </label><br />
		<input type="text" name="ime" class="djoxi" required="required" placeholder="Ime..." />
		<br /> <br />
		
		<label>Prezime: </label><br />
		<input type="text" name="prezime"  class="djoxi" required="required" placeholder="Prezime..." />
		<br /> <br />

		
		<label>Username: </label><br />
		<input type="text" name="username" class="djoxi" required="required" placeholder="Username..." />
		<br /> <br />		
		
		<label>Email: </label><br />
		<input type="email" name="email" class="djoxi" required="required" placeholder="Email..." />
		<br /> <br />
		
		<label>Password: </label><br />
		<input type="password" name="password" class="djoxi" required="required" placeholder="Password..." />
		<br /> <br />		

		
		<input type="submit" class="login_btn"  value="REGISTER!" />

		
	</form>
		  
		  
		  
		  
		  </div>
			<a href="#" class="btn-small js-modal-close zatvori" style="margin-left:730px;">Zatvori</a> 
		<br /><br />
		</div>	






