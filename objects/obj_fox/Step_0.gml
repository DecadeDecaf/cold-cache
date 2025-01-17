var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));

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

var _nest = instance_nearest(x, y, obj_nest);

with (_nest) {
	if (point_distance(x, y, o.x, o.y) < 64 && egg_cooldown <= 0) {
		g.food += (golden ? 20 : 2);
		egg_cooldown = egg_cooldown_max;
		golden = (random(100) < 1);
	}
}

var _slots = instance_nearest(x, y, obj_slots);

with (_slots) {
	if (point_distance(x, y, o.x, o.y) < 64 && slot_cooldown <= 0 && g.food >= 10) {
		g.food -= 10;
		slot_cooldown = slot_cooldown_max;
		slot_left = irandom_range(1, 5);
		slot_middle = irandom_range(1, 5);
		slot_right = irandom_range(1, 5);
	}
}

var _toll = instance_nearest(x, y, obj_toll);

with (_toll) {
	if (point_distance(x, y, o.x, o.y) < 64 && toll_cooldown <= 0) {
		if (g.food >= 50) {
			g.food -= 50;
			toll_cooldown = toll_cooldown_max;
		} else {
			o.x -= o.xv;
			o.xv = 0;
		}
	}
}

var _cache = instance_nearest(x, y, obj_cache);

with (_cache) {
	if (point_distance(x, y, o.x, o.y) < 64 && g.food > 0) {
		win_condition -= g.food;
		win_condition = max(0, win_condition)
		g.food = 0;
	}
}