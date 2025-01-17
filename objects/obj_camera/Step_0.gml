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