
/* 
Slider
*/

function slider_fnc_hide_img() {
	$('.slider_img1').show(0);

	$('.slider_img2').hide(0);
	$('.slider_img3').hide(0);
	$('.slider_img4').hide(0);
}

function change_img(img_id) {
	if (img_id == '') {
		alert('Image ID is empty!');
	} else if (img_id == 1) {
		$('#change_img_str1').html('<img src="/assets/img/icon/slider/str_down_act.png">');

		$('#change_img_str2').html('<img src="/assets/img/icon/slider/str_down.png">');
		$('#change_img_str3').html('<img src="/assets/img/icon/slider/str_down.png">');
		$('#change_img_str4').html('<img src="/assets/img/icon/slider/str_down.png">');

		$('.slider_img1').show(300);

		$('.slider_img2').hide(300);
		$('.slider_img3').hide(300);
		$('.slider_img4').hide(300);

		$('.slider_button1').addClass('sl_button_li_act');

		$('.slider_button2').removeClass('sl_button_li_act');
		$('.slider_button3').removeClass('sl_button_li_act');
		$('.slider_button4').removeClass('sl_button_li_act');
	} else if (img_id == 2) {
		$('#change_img_str2').html('<img src="/assets/img/icon/slider/str_down_act.png">');

		$('#change_img_str1').html('<img src="/assets/img/icon/slider/str_down.png">');
		$('#change_img_str3').html('<img src="/assets/img/icon/slider/str_down.png">');
		$('#change_img_str4').html('<img src="/assets/img/icon/slider/str_down.png">');

		$('.slider_img2').show(300);

		$('.slider_img1').hide(300);
		$('.slider_img3').hide(300);
		$('.slider_img4').hide(300);

		$('.slider_button2').addClass('sl_button_li_act');

		$('.slider_button1').removeClass('sl_button_li_act');
		$('.slider_button3').removeClass('sl_button_li_act');
		$('.slider_button4').removeClass('sl_button_li_act');
	} else if (img_id == 3) {
		$('#change_img_str3').html('<img src="/assets/img/icon/slider/str_down_act.png">');

		$('#change_img_str1').html('<img src="/assets/img/icon/slider/str_down.png">');
		$('#change_img_str2').html('<img src="/assets/img/icon/slider/str_down.png">');
		$('#change_img_str4').html('<img src="/assets/img/icon/slider/str_down.png">');

		$('.slider_img3').show(300);

		$('.slider_img1').hide(300);
		$('.slider_img2').hide(300);
		$('.slider_img4').hide(300);

		$('.slider_button3').addClass('sl_button_li_act');

		$('.slider_button1').removeClass('sl_button_li_act');
		$('.slider_button2').removeClass('sl_button_li_act');
		$('.slider_button4').removeClass('sl_button_li_act');
	} else if (img_id == 4) {
		$('#change_img_str4').html('<img src="/assets/img/icon/slider/str_down_act.png">');

		$('#change_img_str1').html('<img src="/assets/img/icon/slider/str_down.png">');
		$('#change_img_str2').html('<img src="/assets/img/icon/slider/str_down.png">');
		$('#change_img_str3').html('<img src="/assets/img/icon/slider/str_down.png">');

		$('.slider_img4').show(300);

		$('.slider_img1').hide(300);
		$('.slider_img2').hide(300);
		$('.slider_img3').hide(300);

		$('.slider_button4').addClass('sl_button_li_act');

		$('.slider_button1').removeClass('sl_button_li_act');
		$('.slider_button2').removeClass('sl_button_li_act');
		$('.slider_button3').removeClass('sl_button_li_act');
	} else {
		alert('Image ID is not corect!');
	}
}

/* 
Console print
*/
var stop_css = "font-size:50px;color:red;text-shadow:-1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;";
console.log("%c %s",stop_css,'STOP!');

var msg_css = "font-size:15px;color:black;";
console.log("%c %s",msg_css,'This function browser is for developers, if you have a river that over conzola can hack or break into someone\'s GamePanel, you are so wrong this is just a lie!');