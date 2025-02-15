//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D distort_tex;
uniform float time;
//uniform vec2 texel_size;


float size = 2.0;
float strength = 0.027;


void main()
{
    vec2 distort = vec2(0.0); // Initialize distortion vector to zero

    // First distortion
	distort.x += (texture2D(distort_tex, fract(v_vTexcoord * size - vec2(0.0, time))) - 0.5) * strength;
    distort.y += (texture2D(distort_tex, fract(v_vTexcoord * size - vec2(0.0, time))) - 0.5) * strength;
  
    // Second distortion
    //distort.y += (texture2D(distort_tex, fract(v_vTexcoord * size * 1.8 + vec2(0.0, time * 0.7))).r - 0.5) * strength * 1.4;
    //distort.x += (texture2D(distort_tex, fract(v_vTexcoord * size * 0.3 + vec2(0.0, time * 0.9))).r - 0.5) * strength * 1.9;

	vec4 base_color = texture2D(gm_BaseTexture, fract(v_vTexcoord + distort)); 
	

//
    // Output the final blended color
    gl_FragColor = v_vColour * base_color;
}
