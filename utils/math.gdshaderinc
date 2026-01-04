float max3(float x, float y, float z) {
	return max(x, max(y, z));
}

float min3(float x, float y, float z) {
	return min(x, min(y, z));
}

float max4(float x, float y, float z, float w) {
	return max(w, max(x, max(y, z)));
}

float min4(float x, float y, float z, float w) {
	return min(w, min(x, min(y, z)));
}

float angle_between(vec2 a, vec2 b) {
	return acos(dot(normalize(a), normalize(b)));
}