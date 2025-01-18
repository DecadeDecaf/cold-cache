var _mx = mouse_x;
var _my = mouse_y;

if (instance_exists(obj_camera)) {
	_mx -= (obj_camera.x - 960);
}

print(_mx);
print(_my);

if ((_mx >= 1500 && _mx <= 1850 && _my >= 990 && _my <= 1010) || sliding) {
	if (!sliding && mouse_check_button_pressed(mb_left)) {
		sliding = true;
	} else if (sliding && mouse_check_button_released(mb_left)) {
		sliding = false;
	}
	if (sliding) {
		g.vol -= (g.vol - ((_mx - 1500) / 350)) / 4;
		g.vol = median(0, g.vol, 1);
		audio_master_gain(g.vol);
	}
}