<?php 
defined("access") or die("Nedozvoljen pristup");	

if($_SESSION['userid'] == $_SESSION['userid']) {
	
	$user = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM users WHERE userid='$_SESSION[userid]'"));
	$rank = $user['rank'];
	if($rank == "1") {
	


?>

	<div id="bb">
		
		<h3>Admin - Dodaj / Obrisi novost</h3>
	
	
	<div class="black">
	
		<h4>Dodaj novu vest</h4>
		
		<?php 
			
			if(isset($_POST['dodaj'])) {
				
				
			$sadrzaj = htmlspecialchars(mysqli_real_escape_string($con,$_POST['sadrzaj']));
			$naslov = htmlspecialchars(mysqli_real_escape_string($con,$_POST['naslov']));
			
			$sql = "INSERT into obavestenja (`naziv`,`sadrzaj`) VALUES('$naslov','$sadrzaj')";
			$q = mysqli_query($con,$sql);
			
			if($q == "") {
				
				$_SESSION['error'] = "Doslo je do greske!";
				header("Location:/novostiadmin");
				
			}
			if(!$q) {
				
				$_SESSION['error'] = "Doslo je do greske!";
				header("Location:/novostiadmin");
				
			}	
			else {
				
				$_SESSION['ok'] = "Uspesno";
				header("Location:/novostiadmin");
			}
				
			}
		
		?>
		
		<form action="" method="POST">
			
			<input type="text" name="naslov" required="required" class="djoxi" placeholder="Naslov..."> <br />
			<br />
			<textarea type="text" name="sadrzaj" required="required" class="djoxi" style="width:600px; height:150px;" placeholder="Upisi sadrzaj..."></textarea>
			<br />
			<input type="submit" name="dodaj" class="login_btn" value="Dodaj novost" /> 
			
		</form>
	
	</div>
	
	<br /> 
	
	<div class="black">
		
		<h4>Obrisi novost</h4>
		
		<?php 
			
			if(isset($_POST['obrisi'])) {
				
				
				$brid = $_POST['brid'];
				
				$sql = "DELETE FROM obavestenja WHERE id='$brid'";
				
				$q = mysqli_query($con,$sql);
				
				if($q == "")
				{
					
					$_SESSION['error'] = "Doslo je do greske!";
					header("Location:/novostiadmin");
					
				}
				if(!$q) {
					
					$_SESSION['error'] = "Doslo je do greske!";
					header("Location:/novostiadmin");	
					
				}
				else {
					
					$_SESSION['ok'] = "Uspesno!";
					header("Location:/novostiadmin");
					
				}
				
			}
		
		?>
		
		<form action="" method="POST">
			
			
			<input type="text" name="brid" class="djoxi" placeholder="Upisi ID novosti" />
			<input type="submit" name="obrisi" class="login_btn" value="Obrisi novost" />
			
			
		
		</form>
	</div>
	
	</div>
	
<?php 

}

else {
	
	$_SESSION['error'] = "Nemat pristup!";
	header("Location:/index.php");
	
}

};?>

