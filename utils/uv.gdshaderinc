vec2 repeat_x(vec2 uv, float times) {
	return vec2(fract(uv.x * times), uv.y);
}

vec2 repeat_y(vec2 uv, float times) {
	return vec2(uv.x, fract(uv.y * times));
}

vec2 tile(vec2 uv, vec2 tile_size) {
	return fract(uv * tile_size);
}

vec2 translate(vec2 uv, vec2 offset) {
	uv += offset;
	return uv;
}

vec2 flip_x(vec2 uv) {
	return vec2(1. - uv.x, uv.y);
}

vec2 flip_y(vec2 uv) {
	return vec2(uv.x, 1. - uv.y);
}

vec2 mirror_x(vec2 uv) {
	return vec2(uv.x < 0.5 ? uv.x : 1.0 - uv.x, uv.y);
}

vec2 mirror_y(vec2 uv) {
	return vec2(uv.x, uv.y < 0.5 ? uv.y : 1.0 - uv.y);
}

vec2 scale(vec2 uv, vec2 pivot, vec2 scale) {
	uv -= pivot;
	uv *= scale;
	uv += pivot;
	return uv;
}

vec2 rotate(vec2 uv, vec2 pivot, float angle) {
	uv -= pivot;
	mat2 rot = mat2(
		vec2(cos(angle), -sin(angle)), 
		vec2(sin(angle), cos(angle))
		);
	uv = rot * uv;
	uv += pivot;
	return uv;
}

vec2 pixelate(vec2 uv, float amount) {
	return floor(uv * amount) / amount;
}

vec2 to_polar(vec2 uv) {
	float r = sqrt(uv.x * uv.x + uv.y * uv.y);
	float phi = atan(uv.y, uv.x);
	return vec2(r, phi);
}

vec2 from_polar(vec2 v) {
	// v.x = r; v.y = phi
	float x = v.x * cos(v.y);
	float y = v.x * sin(v.y);
	return vec2(x, y);
}

vec2 swirl(vec2 uv, vec2 pivot, float strength) {
	uv = uv - pivot;
	vec2 polar_uv = to_polar(uv);
	polar_uv.y += polar_uv.x * strength;
	uv = from_polar(polar_uv);
	return uv + pivot;
}

vec2 twist(vec2 uv, vec2 pivot, float strength) {
	uv = uv - pivot;
	vec2 polar_uv = to_polar(uv);
	polar_uv.y += (1. - polar_uv.x) * strength;
	uv = from_polar(polar_uv);
	return uv + pivot;
}