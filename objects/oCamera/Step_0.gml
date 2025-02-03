if (instance_exists(oPlayer)) follow = (oPlayer);

xTo = (follow.x);
yTo = (follow.y);

x += (xTo - x)/8;
y += (yTo - y)/8;

shakeA = max(0, shakeA - ((1/shakeL)*shakeM));
x += random_range(-shakeA,shakeA);
y += random_range(-shakeA, shakeA);

camera_set_view_size(cam,global.ideal_width*zoom,global.ideal_height*zoom);
viewwidthhalf = camera_get_view_width(cam)*0.5;
viewheighthalf = camera_get_view_height(cam)*0.5;

x = clamp(x,viewwidthhalf ,room_width  - viewwidthhalf);
y = clamp(y,viewheighthalf,room_height - viewheighthalf);


camera_set_view_pos(cam,x-viewwidthhalf,y-viewheighthalf);