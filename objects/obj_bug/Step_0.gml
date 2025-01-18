if (ofc < 20) {
	image_alpha += 0.05;
}

var _left = false;
var _right = false;

var _fox = instance_nearest(x, y, obj_fox);

with (_fox) {
	if (point_distance(x, y, o.x, o.y) < 32) {
		g.food += 10;
		g.greentext = 10;
		with (o) { splat(3, 24); }
		instance_destroy(o);
		exit;
	} else if (point_distance(x, y, o.x, o.y) < 256) {
		if (o.x < x) { _left = true; }
		if (o.x > x) { _right = true; }
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

x += xv;

if (xv > 0.35) { image_xscale = 1; }
if (xv < -0.35) { image_xscale = -1; }

var _padding = 96;
x = clamp(x, _padding, room_width - _padding);