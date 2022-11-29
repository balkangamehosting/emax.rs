<section>

			<li>

		<!--	<div id="logo"></div> -->

			</li>



			<?php if (is_login() == false) { ?>

				<li class="left">

					<div class="login_form">

						<ul style="width:100%;">

							<form action="/process.php?task=login" method="POST" autocomplete="off">

								<li class="inline" style="float:right;display:block;">

									<ul class="inline">

										<li style="display:block;">

											<span class="inline" id="span_for_name">

												<div class="none">

													<img src="/img/icon/katanac-overlay.png" style="width:33px;position:absolute;margin:3px -18px;">
													
													<img src="/img/icon/user-icon-username.png" style="width:11px;margin:9px -9px;position:absolute;">

												</div>

											</span>

											<input type="text" name="email" placeholder="email" required autocomplete="email">

										</li>

										<li style="display:block;">

											<span class="inline" id="span_for_pass">

												<div class="none">

													<img src="/img/icon/katanac-overlay.png" style="width:33px;position:absolute;margin:3px -18px;">
													
													<img src="/img/icon/katanac-pw.png" style="width:9px;margin:9px -9px;position:absolute;">

												</div>

											</span>

											<input type="password" name="pass" placeholder="password" required>

										</li>

										

										<div id="loginBox">

											<li><a href="demo_login.php?email=demo@e-max.rs&pass=demo1337"><?php echo $jezik['DEMO']; ?></a></li>
											
											<li><button><?php echo $jezik['LOGIN']; ?> <img src="/img/icon/KATANAC-submit.png" style="width: 7px;"></button></li>

										</div>



									</ul>

								</li>

							</form>

						</ul>

					</div>

				</li>

			<?php } else { ?>

				<li class="left">

					<div class="login_form">

						<ul style="width:100%;">

							<li class="inline prof_inf_hdr">

								<div class="av left">

									<img src="<?php echo userAvatar($_SESSION['userid']); ?>" style="width:90px;height:90px;">

								</div>



								<ul class="inline right" style="margin-right:30px;">

									<li style="display:block;">

										<span class="fa fa-user" style="color:#bbb;"></span> 
										
										<span style="color: #fff;"><?php echo userIme($_SESSION['userid']); ?></span>

									</li>

									
									<li style="display:block;">

										<span class="fa fa-mail-forward" style="color:#bbb;"></span> 

										<span style="color: #fff;"><?php echo get_client_ip(); ?></span>

									</li>

									<li style="display:block;">

										<span class="fa fa-calendar" style="color:#bbb;"></span> 

										<span style="color: #fff;"><?php echo lastLogin($_SESSION['userid']); ?></span>

									</li>

									<li style="display:block;">

										<span class="fa fa-money" style="color:#bbb;"></span> 

										<span style="color: #fff;"><?php echo userMoneyWithValute(userMoney($_SESSION['userid']), userCountry($_SESSION['userid'])); ?></span>

									</li>

									<br>

									<div id="loginBox" style="margin-left:-100px;">

										<li><a href="/gp-settings.php"><?php echo $jezik['EDIT']; ?></a></li>

										<li><a href="/gp-billing.php"><?php echo $jezik['BILLING']; ?></a></li>

										<li><a href="/logout.php"><?php echo $jezik['LOGOUT']; ?></a></li>

									</div>

								</ul>

							</li>

						</ul>

					</div>

				</li>

			<?php } ?>

		</section>
<div class="space clear" style="margin-top: 20px;"></div>