var _sprite = (g.one_button ? spr_sign_controls_one_button : spr_sign_controls);
var _image = 0;

if (g.one_button) {
	with (obj_fox) {
		var _pressing = (keyboard_check(vk_anykey) || mouse_check_button(mb_any))
		if (move_toggle < 0) { _image = (!_pressing ? 1 : 2); }
		if (move_toggle > 0) { _image = (!_pressing ? 0 : 3); }
	}
}

draw_sprite_ext(_sprite, _image, x, y, image_xscale, image_yscale, 0, -1, 1);