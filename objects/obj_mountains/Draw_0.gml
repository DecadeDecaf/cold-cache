var _x = x;
var _y = y;

if (instance_exists(obj_camera)) {
	_x += ((obj_camera.x - 1920) / (5/3));
}

draw_sprite_ext(sprite_index, image_index, _x, _y, 1, 1, 0, -1, 0.5);