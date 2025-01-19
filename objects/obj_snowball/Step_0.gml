x += snow_xv;
y += snow_yv;

var _fox = instance_nearest(x, y, obj_fox);

with (_fox) {
	if (abs(x - o.x) < 48 && abs((y - 32) - o.y) < 16) {
		dead = true;
		g.deaths++;
		g.fade_out = 20;
		splat(5, 32);
		if (g.phase == 3) {
			dead_x = 6976;
			g.phase = 2;
		} else {
			dead_x = 128;
			g.phase = 1;
		}
		audio_play_sound_at(snd_snowball, -o.x, 800, 0, 1280, 640, 1, false, 1, 0.5);
		with (o) { splat(6, 0); }
		instance_destroy(o);
		exit;
	}
}

var _coin = instance_nearest(x, y, obj_coin);

with (_coin) {
	if (point_distance(x, y - 362, o.x, o.y) < 64) {
		coin_cooldown = coin_cooldown_max;
		image_index = choose(0, 6);
		flips_left = choose(60, 66);
		flip_speed = 2;
		until_flip = flip_speed;
		audio_stop_sound(snd_flip);
		audio_play_sound_at(snd_flip, -x, 800, 0, 1280, 640, 1, false, 1);
		o.snow_xv = 0;
		o.snow_yv = -10;
	}
}

var _cloud = instance_nearest(x, y, obj_cloud);

with (_cloud) {
	if (abs(x - o.x) < 240 && abs((y - 160) - o.y) < 134 && o.snow_yv < 0 && image_index < 4) {
		image_index = 4;
		anim_cooldown = 40;
		flash = 10;
		hp--;
		audio_play_sound_at(snd_snowball, -o.x, 800, 0, 1280, 640, 1, false, 1, 0.5);
		if (hp <= 0) {
			dead = true;
			g.phase = 4;
			with (obj_snowball) { splat(6, 0); }
			instance_destroy(obj_snowball);
			audio_sound_gain(mus_boss, 0, 500);
		} else {
			with (o) { splat(6, 0); }
			instance_destroy(o);
		}
		exit;
	}
}


if (ofc < 10) {
	image_alpha += 0.1;
	image_xscale += 0.025;
	image_yscale += 0.025;
} else if (y >= 760) {
	audio_play_sound_at(snd_snowball, -x, 800, 0, 1280, 640, 1, false, 1, 0.5);
	splat(6, 0);
	instance_destroy();
}