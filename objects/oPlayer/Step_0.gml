key_up = keyboard_check(ord("W")); // keyboard_check(vk_up);
key_left = keyboard_check(ord("A")); //or keyboard_check(vk_left);
key_down = keyboard_check(ord("S")); //or keyboard_check(vk_down);
key_right = keyboard_check(ord("D")); //or keyboard_check(vk_right);

key_jump = keyboard_check(vk_space);

var on_ground = place_meeting(x,y+1,oCollis);

if on_ground {
	coyote_t = 70
	if landed = false {
		landed = true
		screen_shake(4,5)
	}
}

if on_ground = false {
	landed = false	
}



inputdir = key_right-key_left


hspd += accel*inputdir;

if inputdir = 0{
	var fric_final = air_fric
	if on_ground {
		fric_final = ground_fric
	}
	
	hspd = approach(hspd,0,fric_final)
}

hspd = clamp(hspd,-max_hspd,max_hspd);

if key_jump and coyote_t > 0
{
	screen_shake(2,3)
	vspd = jump_spd;
	coyote_t = 0
}

vspd += grv


if hspd != 0
	image_xscale = sign(hspd);
	
if inputdir != 0
	image_xscale = sign(inputdir);
	
if mouse_x-x != 0
	image_xscale = sign(mouse_x-x);


coyote_t = approach(coyote_t,0,1)

if(place_meeting(x+hspd,y,oCollis))
{
	while(!place_meeting(x+sign(hspd),y,oCollis))
	{
		x+= sign(hspd);
	}
	hspd = 0
}
x += hspd

if(place_meeting(x,y+vspd,oCollis))
{
	while(!place_meeting(x,y+sign(vspd),oCollis))
	{
		y += sign(vspd);
	}
	vspd = 0
}
y += vspd