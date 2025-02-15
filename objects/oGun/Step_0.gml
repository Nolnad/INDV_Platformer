x = lerp(x,owner.x,0.5)
y = lerp(y,owner.y,0.5)

aim_dir = point_direction(x,y,mouse_x,mouse_y)

image_angle = aim_dir
key_attack = mouse_check_button(mb_left)

image_yscale = sign(mouse_x-x)

if key_attack and shoot_del <= 0 {
	bc += 1
	shoot_del = shoot_del_max
	with instance_create_depth(x+lengthdir_x(20,aim_dir),y+lengthdir_y(20,aim_dir),depth+10,oBullet) {
		spd = other.bspd;
		dir = other.aim_dir;
		image_angle = dir 
	}
	
	var kick_back = 4
	x-=lengthdir_x(kick_back,aim_dir)
	y-=lengthdir_y(kick_back,aim_dir)
	
	if bc > bc_max 
	{
		shoot_del= reload_t;
		bc = 0
	}
}

shoot_del --;