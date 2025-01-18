if (spawn) {
	if (ofc > 80) {
		image_alpha += 0.01;
		if (image_alpha >= 1) {
			g.phase = 3;
			spawn = false;
			anim_cooldown = 80;
		}
	}
	exit
}

if (flash > 0) {
	flash--;
}

if (dead) {
	y += 0.5;
	image_alpha -= 0.01;
	if (image_alpha <= 0) {
		instance_destroy();
		g.fade_out = 40;
	}
	exit
}

var _left = false;
var _right = false;

var _fox = instance_nearest(x, y, obj_fox);

with (_fox) {
	if (o.anim_cooldown > 0) {
		o.anim_cooldown--;
		if (o.anim_cooldown <= 0) {
			if (o.image_index == 2) {
				o.image_index = 3;
				o.anim_cooldown = 20;
				for (var _ball_xv = -8; _ball_xv <= 8; _ball_xv += 8) {
					var _ball = instance_create_depth(o.x, o.y - 160, o.depth - 1, obj_snowball);
					_ball.snow_xv = _ball_xv;
				}
				audio_play_sound_at(snd_spit, -o.x, 800, 0, 1280, 640, 1, false, 1);
			} else if (o.image_index == 3) {
				o.image_index = 0;
			} else if (o.image_index == 4) {
				o.image_index = 0;
			}
		}
	} else {
		if (point_distance(x, o.y, o.x, o.y) < 32 && o.image_index == 0) {
			o.image_index = 2;
			o.anim_cooldown = 40;
		} else if (o.image_index == 0) {
			if (o.x > x) { _left = true; }
			if (o.x < x) { _right = true; }
		}
	}
}

var _hori = 0;

if (_left) {
	_hori--;
}

if (_right) {
	_hori++;
}

var _spd = 2.5;

xv += (_spd * _hori);
xv /= 1.25;

x += xv;

var _padding = 96;
x = clamp(x, _padding, room_width - _padding);