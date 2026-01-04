float saw(float x, float period) {
	return mod(x, period) / period;
}

float triangle(float x, float period) {
	return abs(saw(x, period) * 2.0 - 1.0);
}

float pulse(float t, float period, float width) {
	float x = saw(t, period);
	return step(x, width);
}

float ping_pong(float x, float period) {
    float y = mod(x, period) / period;
    return y < 0.5 ? y * 2.0 : 2.0 - y * 2.0;
}

float ease_in_quad(float x) {
	return x * x;
}

float ease_out_quad(float x) {
	return 1. - (1. - x) * (1. - x);
}

float ease_inout_quad(float x) {
	return x < 0.5 ? 
		2. * x * x : 
		1. - (2. - 2. * x) * (2. - 2. * x) / 2.;
}

float ease_in_cubic(float x) {
	return x * x * x;
}

float ease_out_cubic(float x) {
	float u = 1. - x;
	return 1. - u * u * u;
}

float ease_inout_cubic(float x) {
	return x < 0.5 ?
		4. * x * x * x :
		1. - pow(2. - 2. * x, 3) / 2.;
}

float ease_in_expo(float x) {
	return x == 0.0 ? 0.0 : pow(2.0, 10.0 * x - 10.0);
}

float ease_out_expo(float x) {
	return x == 1.0 ? 1.0 : 1.0 - pow(2.0, -10.0 * x);
}

float ease_inout_expo(float x) {
	return x == 0.0 ? 0.0 :
	       x == 1.0 ? 1.0 :
	       x < 0.5  ? pow(2.0, 20.0 * x - 10.0) * 0.5 :
	                  (2.0 - pow(2.0, -20.0 * x + 10.0)) * 0.5;
}

float ease_in_circ(float x) {
	return 1.0 - sqrt(1.0 - x * x);
}

float ease_out_circ(float x) {
	x -= 1.0;
	return sqrt(1.0 - x * x);
}

float ease_inout_circ(float x) {
	return x < 0.5
		? (1.0 - sqrt(1.0 - 4.0 * x * x)) * 0.5
		: (sqrt(1.0 - pow(-2.0 * x + 2.0, 2.0)) + 1.0) * 0.5;
}

float smooth01(float x) {
	return smoothstep(0.0, 1.0, x);
}