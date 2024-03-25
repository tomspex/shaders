shader_type canvas_item;

uniform vec4 pathColor:source_color;

#define amplitude 0.2
#define frequency 10.0
#define speed 10.0
#define offset 0.5
#define stepval 0.1

void fragment() {
	float path = amplitude * sin(UV.x * frequency + TIME * speed) + offset;
	float distPath = distance(UV.y, path);
	float stepPath = step(distPath, stepval);
	
	COLOR = texture(TEXTURE, UV);
	COLOR.rgb *= 1.0-stepPath*pathColor.a;
	COLOR.rgb += stepPath*pathColor.rgb*pathColor.a;
	COLOR.a += stepPath*pathColor.a;
}