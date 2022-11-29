<?php if($game == "gta") { ?>

<script>

function izracunajCenu(){
	var slot=$("option:selected","#slotovi").val();
	var flag=$("#flag").attr("title");
	var Izdvajanje=$("#odaberiigru").val();
	
	if(Izdvajanje == 1) {
		var Izdvajanjep = '0.070|&euro;';
		$('.premium').css('display', 'none');
		$('.lite').css('display', 'block');
		var slot=$("option:selected",".lite").val();
	} else {
		if(Izdvajanje == 2) {
			var Izdvajanjep = '0.090|&euro;';
			$('.premium').css('display', 'block');
			$('.lite').css('display', 'none');						
			var slot=$("option:selected",".premium").val();
		}
	}

	var Izdvajanje=Izdvajanjep.split("|");
	var CenaSlota=Izdvajanje[0];
	var Valuta=Izdvajanje[1];
	var Mesec=$("#meseci").val();
	var Cena=slot;
	var Popust=0;
	
	if(Mesec==2)Popust=5/100;else
	if(Mesec==3)Popust=10/100;else
	if(Mesec==6)Popust=15/100;else
	if(Mesec==12)Popust=20/100;

	var CenaPopust=Math.round(Cena*Mesec*100)/100;
	Cena*=CenaSlota;
	Cena-=(Cena*Popust);
	CenaPopust*=CenaSlota;
	CenaPopust=Math.round(CenaPopust*100)/100;
	Cena*=Mesec;Cena=Cena.toFixed(2);
	Cena=Cena.replace(".00","");
	var cena_valuta_zemlja=Cena+" "+Valuta;
	var cena_valuta_zemljaa=Cena;

	if(!(slot>0))cena_valuta_zemlja="Izaberite broj slotova";
	$("#cena").html(cena_valuta_zemlja);
	$("#cijenaserverainput").val(cena_valuta_zemljaa);
}

</script>	

<form action="/fnc/buy.php?task=buy_gta" method="POST" class="form-horizontal">

	<div class="col-md-6">
		<div class="NarServerPrviDeo">
			
			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;"><i class="fa fa-user"></i></span>
					</div>
				</span>
				<input type="text" required="required" placeholder="ime i prezime" name="ime" class="NarServer" />	
			</li>

			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;"><i class="fa fa-user"></i></span>
					</div>
				</span>
				<input type="email" required="required" placeholder="email" name="email" class="NarServer" />	
			</li>

			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:9px -19px;position:absolute;color:#fff;"><i class="fa fa-gamepad"></i></span>
					</div>
				</span>
				<select name='odaberiteigru' class="NarServer">
					<option value='gta'>GTA San Andreas</option>
				</select>	
			</li>

			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;">
							<i class="fa fa-user-plus"></i>
						</span>
					</div>
				</span>
				<select name='odaberiteslotove' class='NarServer lite' id='slotovi'  onChange='izracunajCenu();'>
					<option value='0'>Broj slotova</option>
					<option value='50'>50 slotova</option>
					<option value='100'>100 slotova</option>
					<option value='150'>150 slotova</option>
					<option value='200'>200 slotova</option>
					<option value='250'>250 slotova</option>
					<option value='300'>300 slota</option>
					<option value='350'>350 slota</option>
					<option value='400'>400 slota</option>
					<option value='450'>450 slotova</option>
					<option value='500'>500 slotova</option>
				</select>
				
				<select name='odaberiteslotove2' class='NarServer premium' id='slotovi' onChange='izracunajCenu();' style="display: none;">
					<option value='0'>Broj slotova</option>
					<option value='50'>50 slotova</option>
					<option value='100'>100 slotova</option>
					<option value='150'>150 slotova</option>
					<option value='200'>200 slotova</option>
					<option value='250'>250 slotova</option>
					<option value='300'>300 slota</option>
					<option value='350'>350 slota</option>
					<option value='400'>400 slota</option>
					<option value='450'>450 slotova</option>
					<option value='500'>500 slotova</option>
				</select>
			</li>

			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;"><i class="fa fa-user-plus"></i></span>
					</div>
				</span>
				<input type="text" required="required" placeholder="naziv servera" name="naziv" class="NarServer" />		
			</li>

		</div>
	</div> <!-- PRVI DEO -->

	<div class="col-md-6">
		<div class="NarServerDrugiDeo">
		
			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;">
							<i class="fa fa-user-plus"></i>
						</span>
					</div>
				</span>
				<select name='lokacija' class="NarServer" id='odaberiigru' onchange='izracunajCenu();'>
					<option value=''>Izaberite lokaciju</option>
					<option value='1'>Lite - Njemacka</option>
					<option value='2' disabled style="color: #ccc;">Lite - Poljska</option>
					<option value='3' disabled style="color: #ccc;">Lite - Francuska</option>
					<option value='4'>Premium - Srbija</option>
					<option value='5' disabled style="color: #ccc;">Premium - BiH</option>
				</select>			
			</li>			

			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;">
							<i class="fa fa-gamepad"></i>
						</span>
					</div>
				</span>
				<select name='mod' class="NarServer">
					<option value=''>Izaberite mod</option>
					<?php
					$mod = mysql_query("SELECT * FROM `modovi` WHERE `igra` = '2'");
					
					while($row = mysql_fetch_array($mod)) { ?>
						<option value="<?php echo $row['id']; ?>"><?php echo $row['ime']; ?></option>
					<?php } ?>
				</select>		
			</li>	

			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;">
							<i class="fa fa-shopping-cart"></i>
						</span>
					</div>
				</span>
				<select name='nacinplacanja' class="NarServer">
					<option value=''>Nacin placanja</option>
					<option value='Bank/Posta'>Banka/Posta</option>
					<option value='PayPal'>PayPal</option>
					<option value='SMS'>SMS</option>
				</select>		
			</li>						

			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;">
							<i class="glyphicon glyphicon-signal"></i>
						</span>
					</div>
				</span>
				<select name='mjeseci' class="NarServer" id='meseci' onChange='izracunajCenu();'>
					<option value='1'>1 Mesec</option>
					<option value='2'>2 Meseca ( 5 % popusta )</option>
					<option value='3'>3 Meseca ( 10 % popusta )</option>
					<option value='6'>6 Meseci ( 15 % popusta )</option>
					<option value='12'>12 Meseci ( 20 % popusta )</option>
				</select>		
			</li>						

			<li style="display:block;">
				<span class="inline" id="span_for_name">
					<div class="none">
						<img src="/img/icon/katanac-overlay.png" style="width:46px;position:absolute;margin:3px -30px;">
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;"><i class="fa fa-euro"></i></span>
					</div>
				</span>
				<div readonly='readonly' class="NarServer" id='cena'>
					<span style="position:absolute;margin-top:6px;left:45px;">0.00 &euro;</span>
				</div>	
				<input type='hidden' id='cijenaserverainput' name='cijenaserverainput'>	
			</li>

		</div>
	</div>

	<div class="NarServerButton" style="position:absolute;right:35px;bottom:110px;">		
		<input type='submit' name='naruciserver' class='btn order' value='Naruci'>

	</div>

</form>

<div id="pay_naruci" style="position:absolute;right:15px;bottom:50px;">
	<form name="paypalForm" action="/_buy/paypal.php" method="POST">
		<input type="hidden" name="id" value="GTA">
		<input type="hidden" name="CatDescription" value="Buying Gta San Andreas game servers">
		<input type="hidden" id="payment" name="payment" value="10">	  
		<input type="hidden" name="key" value="<?php echo md5(date('Y-m-d:').rand()); ?>">
		<input type="image" src="https://www.paypalobjects.com/en_US/AT/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
	</form>
</div>


<?php } ?>