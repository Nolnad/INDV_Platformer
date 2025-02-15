vspd += grv;

x += hspd

y += vspd 

life_t -= 1

surface_set_target(global.blood_surf);
draw_sprite_ext(sBloodSplatter,0,x,y,1,1,random(360),c_white,random_range(0.7,1))
surface_reset_target();

if life_t <= 0 {
	instance_destroy()	;
}