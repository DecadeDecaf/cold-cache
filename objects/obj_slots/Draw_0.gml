var _image = (slot_cooldown > 0 ? 1 : 0);

draw_sprite_ext(sprite_index, _image, x, y, image_xscale, image_yscale, 0, -1, 1);

var _frame = (g.gfc % 12 < 6 ? 0 : 1);

if (slot_middle > 0) {	
	var _slot_left = (slot_left + 1);
	var _slot_middle = (slot_middle + 1);
	var _slot_right = (slot_right + 1);

	var _left_spinning = (slot_cooldown > 250);
	var _middle_spinning = (slot_cooldown > 200);
	var _right_spinning = (slot_cooldown > 150);

	draw_sprite(spr_slots_left, (_left_spinning ? _frame : _slot_left), x, y);
	draw_sprite(spr_slots_middle, (_middle_spinning ? _frame : _slot_middle), x, y);
	draw_sprite(spr_slots_right, (_right_spinning ? _frame : _slot_right), x, y);
}

draw_set_font(fnt_font_small);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _str = "COST 10 FOOD";

if (slot_cooldown > 0) {
	_str = "";
	if (slot_cooldown < 150) {
		var _winning = calc_winnings();
		_str = (_winning > 0 ? "WON " + string(_winning)  + " FOOD!" : "BETTER LUCK NEXT TIME")
	}
}

var _y = (y - 272);
var _dropshadow_dis = 1.5;

var _black = #10121C;
var _white = #FFFFFF;

draw_set_color(_black);
draw_text_ext_transformed(x - _dropshadow_dis, _y + _dropshadow_dis, _str, 32, 320, 1, 1, 0);

draw_set_color(_white);
draw_text_ext_transformed(x, _y, _str, 32, 320, 1, 1, 0);