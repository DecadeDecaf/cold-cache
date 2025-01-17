draw_self()

draw_set_font(fnt_font_small);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _str = "STORE " + string(win_condition) + " MORE FOOD IN CACHE TO WIN";

var _y = (y - 272);
var _dropshadow_dis = 1.5;

var _black = #10121C;
var _white = #FFFFFF;

draw_set_color(_black);
draw_text_ext_transformed(x - _dropshadow_dis, _y + _dropshadow_dis, _str, 32, 320, 1, 1, 0);

draw_set_color(_white);
draw_text_ext_transformed(x, _y, _str, 32, 320, 1, 1, 0);