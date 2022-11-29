<?php
defined("access") or die("Nedozvoljen pristup");
?>

<?php
ob_start();
?>
<div id="bb">
<?php



   $kveri = mysqli_query($con,"SELECT * FROM obavestenja");
	/*Paginacija test CREDITS: Adam*/
	$broj_artikala = mysqli_num_rows($kveri);
	if(isset($_GET['stranica'])){
		$page = preg_replace('#[^0-9]#i', '', $_GET['stranica']);
	} else {
		$page = 1;
	}
	//Podataka po stranici * kps *
	$kps = 5; //Broj podataka po stranici
	$zadnja = ceil($broj_artikala/$kps);

	if ($page < 1){
		$page = 1;	
	} elseif ($page > $zadnja){
		$page = $zadnja;	
	}

	$centar = "";
	$sub1 = $page - 1;
	$sub2 = $page - 2;
	$add1 = $page + 1;
	$add2 = $page + 2;
	if ($page == 1) {
	    $centar .= '<div class="pagination"><ul>';
		$centar .= '<li class="active"><a href="/obavestenja/&stranica=' . $page . '">' . $page . '</a></li>';
		$centar .= '<li><a href="/obavestenja/&stranica=' . $add1 . '">' . $add1 . '</a></li> ';
	} else if ($page == $zadnja) {
		$centar .= '<a href="/obavestenja/&stranica=' . $sub1 . '">' . $sub1 . '</a> ';
		$centar .= '<li><span style="color:#999999;">' . $page . '</span></li>';
	} else if ($page > 2 && $page < ($zadnja - 1)) {
		$centar .= '<a href="/obavestenja/&stranica=' . $sub2 . '">' . $sub2 . '</a> ';
		$centar .= '<a href="/obavestenja/&stranica=' . $sub1 . '">' . $sub1 . '</a> ';
		$centar .= '<span style="color:#999999;">' . $page . '</span>';
		$centar .= '<a href="/obavestenja/&stranica=' . $add1 . '">' . $add1 . '</a> ';
		$centar .= '<a href="/obavestenja/&stranica=' . $add2 . '">' . $add2 . '</a> ';
	} else if ($page > 1 && $page < $zadnja) {
		$centar .= '<a href="/obavestenja/&stranica=' . $sub1 . '">' . $sub1 . '</a> ';
		$centar .= '<span style="color:#999999;">' . $page . '</span>';
		$centar .= '<a href="/obavestenja/&stranica=' . $add1 . '">' . $add1 . '</a> ';
	}
	$prvi = (($page-1)*$kps);
	$drugi = $kps;
	$kveri2 = mysqli_query($con,"SELECT * FROM obavestenja ORDER BY id DESC LIMIT $prvi,$drugi") or die(mysqli_error());

	$prikazi = "";

	if ($zadnja != "1"){
		if ($page != 1) {
			$prethodna = $page - 1;
			$prikazi .=  '<div class="pagination"><ul><li> <a href="/obavestenja/&stranica='.$prethodna.'">Prethodna</a> </li>';
		} 
		$prikazi .= '<li>'.$centar.'</li>';
		if ($page != $zadnja) {
			$sledeca = $page + 1;
			$prikazi .=  '<li><a href="/obavestenja/&stranica='.$sledeca.'">Sledeca</a></li></ul></div>';
		} 
	}





$vreme = time() + 60;
while($srv = mysqli_fetch_array($kveri2)){

  
 $sadrzaj = nl2br($srv['sadrzaj']);
 $naziv = $srv['naziv'];
 
  
  echo "
		
	<div class='server_box'>
		
		<strong class='zuto'>$naziv</strong>
		
		<br /><br />
		
		$sadrzaj
		
		
	</div><br />
		
  ";
	
		
  
  
}



?>
</table>

<center>
<?php
if(isset($prikazi) && !empty($prikazi)) {
?>
<div class="pagination"><?php echo $prikazi; ?></div>
<?php
}
?>
</center>
</div>