var _x = x;
var _y = y;

var _frame = image_index;

if (_frame == 0) { _frame = (ofc % 40 < 20 ? 0 : 1); }

if (dead) {
	_x += (ofc % 20 < 10 ? -32 : 32)
}

var _white = #FFFFFF;

draw_sprite_ext(sprite_index, _frame, _x, _y, image_xscale, image_yscale, 0, -1, image_alpha);

if (flash > 0) {
	gpu_set_fog(true, _white, 1, 1);
	draw_sprite_ext(sprite_index, _frame, _x, _y, image_xscale, image_yscale, 0, -1, image_alpha);
	gpu_set_fog(false, _white, 0, 0);
}