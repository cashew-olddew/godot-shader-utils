shader_type canvas_item;

#include "utils/uv.gdshaderinc"
#include "utils/animation.gdshaderinc"
#include "utils/conversion.gdshaderinc"

uniform float f_param = 0.0;

void fragment() {
	vec2 uv = UV;
	uv = swirl(uv, vec2(0.5), f_param);
	float color_swap = ease_in_circ(saw(TIME, 1.));
	vec4 new_col = mix(vec4(1.0, 0.0, 0.0, 1.0), vec4(0.0, 1.0, 0.0, 1.0), color_swap);
	vec4 color = texture(TEXTURE, uv);
	new_col.rgb = rgb2hsv(new_col.rgb);
	new_col.rgb = hsv2rgb(new_col.rgb);
	COLOR = new_col;
}
