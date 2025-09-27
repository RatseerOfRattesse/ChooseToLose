shader_type canvas_item;

uniform bool enabled = true;

void vertex() {
	if (enabled) {
		UV.x += TIME * 0.1;
	} else {
		UV.x = UV.x;
	}
}