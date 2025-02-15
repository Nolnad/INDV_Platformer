x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);

image_angle = dir;

if hp <= 0 {
	
	repeat irandom_range(3,5)
	with instance_create_depth(x,y,depth,oBlood) {
		hspd = random_range(-6,6)
		vspd = -random_range(2,6)
		image_angle = random(360)
	}
	
	instance_destroy();	
}