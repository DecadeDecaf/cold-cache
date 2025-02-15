if (g.game_over) {
	exit
}

if (dead) {
	if (dead_x > x + 12) {
		x += 12;
	} else if (dead_x < x - 12) {
		x -= 12;
	} else if (g.fade_out + g.fade_wait + g.fade_in <= 0) {
		x = dead_x;
		splat(5, 32);
		dead = false;
		if (g.phase == 2) {
			instance_create_depth(6976, 368, depth, obj_cloud);
		}
	}
	exit;
}

var _left = false;
var _right = false;

if (g.one_button) {
	var _pressed = (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any) || gamepad_check_pressed());
	var _pressing = (keyboard_check(vk_anykey) || mouse_check_button(mb_any) || gamepad_check());
	if (_pressed) {
		move_toggle *= -1;
	}
	if (_pressing) {
		if (move_toggle < 0) { _left = true; }
		if (move_toggle > 0) { _right = true; }
	} else {
		_left = false;
		_right = false;
	}
} else {
	_left = (keyboard_check(ord("A")) || keyboard_check(vk_left));
	_right = (keyboard_check(ord("D")) || keyboard_check(vk_right));
}

if (g.phase == 2 || g.phase == 4) {
	_left = false;
	_right = false;
}

var _hori = 0;

if (_left) {
	_hori--;
}

if (_right) {
	_hori++;
}

var _spd = 3.5;

xv += (_spd * _hori);
xv /= 1.5;

x += xv;

if (xv > 0.35) { image_xscale = 1; }
if (xv < -0.35) { image_xscale = -1; }

var _padding = 96;
x = clamp(x, _padding, room_width - _padding);

audio_listener_position(-x, 800, 640);

var _nest = instance_nearest(x, y, obj_nest);

with (_nest) {
	if (point_distance(x, y, o.x, o.y) < 64 && egg_cooldown <= 0) {
		g.food += (golden ? 20 : 2);
		egg_cooldown = egg_cooldown_max;
		golden = (random(100) < 1);
		g.greentext = 5;
		splat(4, 56);
		audio_play_sound_at(snd_pop, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1);
	}
}

var _slots = instance_nearest(x, y, obj_slots);

with (_slots) {
	if (point_distance(x, y, o.x, o.y) < 64 && slot_cooldown <= 0 && g.food >= 10) {
		g.food -= 10;
		g.loss += 10;
		slot_cooldown = slot_cooldown_max;
		slot_left = irandom_range(1, 5);
		slot_middle = irandom_range(1, 5);
		slot_right = irandom_range(1, 5);
		g.redtext = 10;
		audio_play_sound_at(snd_slots, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1);
	}
}

var _coin = instance_nearest(x, y, obj_coin);

with (_coin) {
	if (point_distance(x, y, o.x, o.y) < 64 && coin_cooldown <= 0) {
		coin_cooldown = coin_cooldown_max;
		flips_left = choose(60, 66);
		flip_speed = 2;
		until_flip = flip_speed;
		audio_play_sound_at(snd_flip, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1);
	}
}

var _toll = instance_nearest(x, y, obj_toll);

with (_toll) {
	if (point_distance(x, y, o.x, o.y) < 64 && toll_cooldown <= 0) {
		var _price = g.tollprice;
		if (g.food >= _price) {
			g.food -= _price;
			if (_price > 10) {
				g.tollprice -= 10;
			}
			toll_cooldown = toll_cooldown_max;
			g.redtext = 10;
			audio_play_sound_at(snd_toll, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1);
		} else {
			o.x -= o.xv;
			o.xv = 0;
		}
	}
}

var _cache = instance_nearest(x, y, obj_cache);

with (_cache) {
	if (point_distance(x, y, o.x, o.y) < 64 && g.food > 0 && g.phase == 1) {
		win_condition -= g.food;
		win_condition = max(0, win_condition)
		g.food = 0;
		g.redtext = 10;
		audio_play_sound_at(snd_bury, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1);
		if (win_condition <= 0) {
			g.phase = 2;
			instance_create_depth(6976, 368, o.depth, obj_cloud);
			audio_sound_gain(mus_game, 0, 500);
		}
	}
}