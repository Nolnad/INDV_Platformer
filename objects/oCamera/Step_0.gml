if (instance_exists(oPlayer)) follow = (oPlayer);

var inst = collision_point(follow.x,follow.y,oTrigger,true,true)

if (instance_exists(inst)) {
    switch (inst.type) {
        case CAMERASTATES.free:
            targ_x = follow.x + inst.ox;
            targ_y = follow.y + inst.oy;
            smooth = lerp(smooth, inst.smooth, 0.05);
            break;

        case CAMERASTATES.lock_y:
            targ_x = inst.x + inst.ox;
            targ_y = follow.y + inst.oy;
            smooth = lerp(smooth, inst.smooth, 0.05);
            break;

        case CAMERASTATES.lock_x:
            targ_x = follow.x + inst.ox;
            targ_y = inst.y + inst.oy;
            smooth = lerp(smooth, inst.smooth, 0.05);
            break;

        case CAMERASTATES.lock_xy:
            targ_x = inst.x + inst.ox;
            targ_y = inst.y + inst.oy;
            smooth = lerp(smooth, inst.smooth, 0.05);
            break;
    }
} else {
    targ_x = follow.x;
    targ_y = follow.y;
}


xTo = targ_x
yTo = targ_y


x += (xTo - x)/smooth;
y += (yTo - y)/smooth;

shakeA = max(0, shakeA - ((1/shakeL)*shakeM));
x += random_range(-shakeA,shakeA);
y += random_range(-shakeA, shakeA);

camera_set_view_size(cam,global.ideal_width*zoom,global.ideal_height*zoom);
viewwidthhalf = camera_get_view_width(cam)*0.5;
viewheighthalf = camera_get_view_height(cam)*0.5;

x = clamp(x,viewwidthhalf ,room_width  - viewwidthhalf);
y = clamp(y,viewheighthalf,room_height - viewheighthalf);


camera_set_view_pos(cam,x-viewwidthhalf,y-viewheighthalf);