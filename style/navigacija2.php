</nav>

		<nav>

			<ul style="margin-left: 20px;">
				
				<a href="/home"><li class="selected">Home Page</a></li>
				
				<a href="/gp-home.php"><li>Game Panel</a></li>

				<a href="/gp-korisnik.php"><li><?php echo $jezik['Korisnicki Panel']; ?></a></li>
				
				<a href="/naruci.php"><li>Order</a></li>
				
				<a href="/cenovnik.php"><li>Price</a></li>
				
				<a href="https://www.facebook.com/eGameHosting.me/"><li>Contact</a></li>
				
				<a href="http://gametracker.rs/"><li>GameTracker</a></li>

			</ul>



			<?php if (is_login() == false) { ?>

				<div id="reg">

					<a href="/create_user_acc.php">REGISTRUJ SE</a>

				</div>

			<?php } else { ?>

				<div id="reg">

					<a href="/mojprofil.php">MOJ PROFIL</a>

				</div>

			<?php } ?>

		</nav>