
uTime       = shader_get_uniform(shDistort,"time");
uDistortTex = shader_get_sampler_index(shDistort,"distort_tex")
		
draw_sprite(sTree,0,x,y)

shader_set(shDistort);
	
	// Setting up uniforms
	texture_set_stage(uDistortTex,sprite_get_texture(sDistort,0))
	shader_set_uniform_f(uTime,current_time/1000/7);
	
	// draw what we want affected
	draw_sprite(sTree,1,x,y)

shader_reset()
