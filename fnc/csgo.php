<?php if($game == "cs-go") { ?>

<script>

function izracunajCenu(){
	var slot=$("option:selected","#slotovi").val();
	var flag=$("#flag").attr("title");
	var Izdvajanje=$("#odaberiigru").val();
	
	if(Izdvajanje == 1) {
		var Izdvajanjep = '0.439|&euro;';
		$('.premium').css('display', 'none');
		$('.lite').css('display', 'block');
		var slot=$("option:selected",".lite").val();
	} else {
		if(Izdvajanje == 2) {
			var Izdvajanjep = '0.539|&euro;';
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

<form action="/fnc/buy.php?task=buy_csgo" method="POST" class="form-horizontal">

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
					<option value='cs'>Counter Strike: GO</option>
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
                    <option value="12">12</option>
                    <option value="14">14</option>
                    <option value="16">16</option>
                    <option value="18">18</option>
                    <option value="20">20</option>
                    <option value="22">22</option>
                    <option value="24">24</option>
                    <option value="26">26</option>
                    <option value="28">28</option>
                    <option value="30">30</option>
                    <option value="32">32</option>
                    <option value="34">34</option>
                    <option value="36">36</option>
                    <option value="38">38</option>
                    <option value="40">40</option>
                    <option value="42">42</option>
                    <option value="44">44</option>
                    <option value="46">46</option>
                    <option value="48">48</option>
                    <option value="50">50</option>
                    <option value="52">52</option>
                    <option value="54">54</option>
                    <option value="56">56</option>
                    <option value="58">58</option>
                    <option value="60">60</option>
                    <option value="62">62</option>
                    <option value="64">64</option>
                </select>
				
				<select name='odaberiteslotove2' class='NarServer premium' id='slotovi' onChange='izracunajCenu();' style="display: none;">
					<option value="12">12</option>
                    <option value="14">14</option>
                    <option value="16">16</option>
                    <option value="18">18</option>
                    <option value="20">20</option>
                    <option value="22">22</option>
                    <option value="24">24</option>
                    <option value="26">26</option>
                    <option value="28">28</option>
                    <option value="30">30</option>
                    <option value="32">32</option>
                    <option value="34">34</option>
                    <option value="36">36</option>
                    <option value="38">38</option>
                    <option value="40">40</option>
                    <option value="42">42</option>
                    <option value="44">44</option>
                    <option value="46">46</option>
                    <option value="48">48</option>
                    <option value="50">50</option>
                    <option value="52">52</option>
                    <option value="54">54</option>
                    <option value="56">56</option>
                    <option value="58">58</option>
                    <option value="60">60</option>
                    <option value="62">62</option>
                    <option value="64">64</option>
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
					<option value=''>izaberite lokaciju</option>
					<option value='1'>Lite - Njemacka</option>
					<option value='2' disabled style="color: #ccc;">Lite - Poljska</option>
					<option value='3' disabled style="color: #ccc;">Lite - Francuska</option>
					<option value='4' disabled style="color: #ccc;">Premium - Srbija</option>
					<option value='5' disabled style="color: #ccc;">Premium - BiH</option>
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
				<select name='drzava' class="NarServer">
					<option value=''>izaberite drzavu</option>
					<option value='ME'>Crna Gora</option>
					<option value='RS'>Srbija</option>
					<option value='MK'>Makedonija</option>
					<option value='HR'>Hrvatska</option>
					<option value='BA'>Bosna i Hercegovina</option>
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
					<option value=''>nacin placanja</option>
					<option value='Bank/Posta'>Banka/Posta</option>
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
						<span style="font-size:18px;margin:10px -17px;position:absolute;color:#fff;">
							<i class="fa fa-euro"></i>
						</span>
					</div>
				</span>
				<div readonly='readonly' class="NarServer" id='cena'>
					<span style="position:absolute;margin-top:6px;left:45px;">0.00 &euro;</span>
				</div>	
				<input type='hidden' id='cijenaserverainput' name='cijenaserverainput'>	
			</li>

		</div>
	</div>

	<div class="NarServerButton">
		
		<input type='submit' name='naruciserver' class='btn order' value='Naruci'>

	</div>

</form>


<?php } ?>