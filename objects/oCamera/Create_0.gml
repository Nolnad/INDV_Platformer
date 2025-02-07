cam = camera_create_view(0,0,global.ideal_width,global.ideal_height);
view_set_camera(0,cam);
follow = noone;

zoom = 1

viewwidthhalf  = camera_get_view_width(cam) *0.5;
viewheighthalf = camera_get_view_height(cam)*0.5;

xTo = room_width/2;
yTo = room_height/2;

shakeL = 0;
shakeM = 0;
shakeA = 0;

targ_x = 0
targ_y = 0

smooth = 8

enum CAMERASTATES {
	free,
	lock_x,
	lock_y,
	lock_xy
}

state = CAMERASTATES.free