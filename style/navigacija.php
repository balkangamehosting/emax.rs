</nav>

		<nav>

			<ul style="margin-left: 360px;">
				
				<a href="/home"><li class="selected"><i class="fas fa-home"></i><?php echo $jezik[' Pocetna']; ?></a></li>
				
				<a href="/gp-home.php"><li><i class="fab fa-windows"></i><?php echo $jezik[' Game Panel']; ?></a></li>
		
				<a href="/gp-korisnik.php"><li><i class="far fa-comments"></i><?php echo $jezik[' Korisnicki Panel']; ?></a></li>
				
				<a href="/naruci.php"><li><i class="fas fa-cart-arrow-down"></i><?php echo $jezik[' Naruci']; ?></a></li>
				
				<a href="/cenovnik.php"><li><i class="fas fa-dollar-sign"></i><?php echo $jezik[' Cenovnik']; ?></a></li>
				
				<a href="https://www.facebook.com/eGameHosting.me/"><li><i class="fas fa-contact"></i><?php echo $jezik[' Kontakt']; ?></a></li>
				
				<a href="http://gametracker.rs/"><li><i class="far fa-rocket"></i> CS TRACKER</a></li>

			



			<?php if (is_login() == false) { ?>


					<a href="/create_user_acc.php"><li><i class="fas fa-home"></i><?php echo $jezik[' REGISTRUJ SE']; ?></a></li>

				</div>

			<?php } else { ?>


					<a href="/mojprofil.php"><li><i class="fas fa-home"></i><?php echo $jezik[' MOJ PROFIL']; ?></a></li>

				</div>

			<?php } ?>
			</ul>
		</nav> 