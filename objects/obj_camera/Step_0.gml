var _w = camera_get_view_width(camera);
var _h = camera_get_view_height(camera);

var _midw = (_w / 2);
var _midh = (_h / 2);

if (instance_exists(obj_fox)) {
	lookx = obj_fox.x;
	looky = obj_fox.y;
}

lookx = median(_midw, lookx, room_width - _midw);
looky = median(_midh, looky, room_height - _midh);

x += (lookx - x) / 12;
y += (looky - y) / 12;

var _camx = median(_midw, x, room_width - _midw);
var _camy = median(_midh, y, room_height - _midh);

x = _camx;
y = _camy;

var _vm = matrix_build_lookat(_camx, _camy, -10, _camx, _camy, 0, 0, 1, 0);
camera_set_view_mat(camera, _vm);

if (!g.desktop) {
	var _display_w = display_get_width();
	var _display_h = display_get_height();
	if ((_display_w != last_display_w) || (_display_h != last_display_h)) {
		last_display_w = _display_w;
		last_display_h = _display_h;
		var _aspect_ratio = game_width / game_height;
		var _cpad = 10;
		var _cw = _display_w - _cpad;
		var _ch = _display_h - _cpad;
		var _c_aspect_ratio = _cw / _ch;
		var _scalew = _cw;
		var _scaleh = _ch;
		if (_aspect_ratio > _c_aspect_ratio) {
			_scalew = _cw;
			_scaleh = _scalew / _aspect_ratio;
		} else if (_aspect_ratio < _c_aspect_ratio) {
			_scaleh = _ch;
			_scalew = _scaleh * _aspect_ratio;
		}
		window_set_size(_scalew, _scaleh);
		view_wport[0] = _scalew;
		view_hport[0] = _scaleh;
		surface_resize(application_surface, _scalew, _scaleh);
		display_set_gui_size(game_width, game_height)
		window_center();
	}
}