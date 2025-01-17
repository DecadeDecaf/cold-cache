var _x = x;
var _y = y;

var _angle = image_angle;

if (abs(xv) > 0.35) {
	var _frame = (ofc % 20);
	_y += (_frame < 10 ? (_frame / 2) : 5 - (_frame / 2));
}

draw_sprite_ext(sprite_index, 0, _x, _y, image_xscale, image_yscale, _angle, -1, 1);