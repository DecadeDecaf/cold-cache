game_width = 1920;
game_height = 1080;

x = 0;
y = 0;

lookx = 0;
looky = 0;

camera = camera_create();
zw = game_width;
zh = game_height;

camera_set_view_size(camera, zw, zh);

var _vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var _pm = matrix_build_projection_ortho(zw, zh, -10000, 10000);

camera_set_view_mat(camera, _vm);
camera_set_proj_mat(camera, _pm);

last_display_w = -1;
last_display_h = -1;

view_camera[0] = camera;