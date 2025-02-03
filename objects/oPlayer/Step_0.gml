key_up    = keyboard_check(ord("W")); // keyboard_check(vk_up);
key_left  = keyboard_check(ord("A")); //or keyboard_check(vk_left);
key_down  = keyboard_check(ord("S")); //or keyboard_check(vk_down);
key_right = keyboard_check(ord("D")); //or keyboard_check(vk_right);

key_jump = keyboard_check(vk_space);

var on_ground = place_meeting(x,y+1,oCollis);

if on_ground {
	coyote_t = 7
	if landed = false {
		landed = true
		screen_shake(7,4)
	}
}

if on_ground = false {
	landed = false	
}

script_execute(states[state]);

hspd += accel*inputdir;

if (inputdir == 0) {
	var fric_final = air_fric;
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

vspd += grv;


coyote_t = approach(coyote_t,0,1)

PlayerCollision();

if hp <= 0 and state != PLAYERSTATE.dead {
	state = PLAYERSTATE.dead
	state_step = 0
	instance_create_depth(x,y,depth+10,oExplosion)
	screen_shake(5,8);
}