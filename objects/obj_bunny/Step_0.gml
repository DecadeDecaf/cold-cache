if (ofc < 20) {
	image_alpha += 0.05;
}

if (jump_cooldown > 0) {
	jump_cooldown--;
}

var _left = false;
var _right = false;
var _jump = (image_index == 1);

var _fox = instance_nearest(x, y, obj_fox);

with (_fox) {
	if (point_distance(x, y, o.x, o.y) < 48) {
		g.food += 30;
		g.greentext = 10;
		with (o) { splat(5, 24); }
		instance_destroy(o);
		exit;
	} else if (point_distance(x, y, o.x, o.y) < 320 && !_jump && o.jump_cooldown == 0) {
		_jump = true;
		o.image_index = 1;
		o.yv = -8;
		if (o.x > x) { o.image_xscale = 1; }
		if (o.x < x) { o.image_xscale = -1; }
	}
	if (_jump) {
		if (o.image_xscale == -1) { _right = true; }
		if (o.image_xscale == 1) { _right = true; }
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
xv /= 1.5;

if (_jump) {
	yv += 0.15;
}

x += xv;
y += yv;

var _padding = 96;
x = clamp(x, _padding, room_width - _padding);

if (_jump && y >= 800) {
	image_index = 0;
	yv = 0;
	y = 800;
	jump_cooldown = 10;
}