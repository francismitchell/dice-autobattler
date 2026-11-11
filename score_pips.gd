extends Control

@export var num_pips: int = 3
var pip_separation: float = 64.0
var pip_radius: float = 12.0
var pip_line_width: float = 4.0
# if score negative, fill pips to left
var score: int = -2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	for i: int in range(num_pips):
		if i != num_pips - 1:
			draw_line(Vector2(i * pip_separation + pip_radius, 0.0), Vector2((i+1) * pip_separation - pip_radius, 0.0), Color.WHITE, pip_line_width)
			draw_line(Vector2(-(i * pip_separation + pip_radius), 0.0), Vector2(-((i+1) * pip_separation - pip_radius), 0.0), Color.WHITE, pip_line_width)
		if score > 0 and i <= abs(score):
			draw_circle(Vector2(i * pip_separation, 0.0), pip_radius, Color.WHITE, true, 4.0)
			draw_circle(Vector2(-i * pip_separation, 0.0), pip_radius, Color.WHITE, false, 4.0)
		elif score < 0 and i <= abs(score):
			draw_circle(Vector2(i * pip_separation, 0.0), pip_radius, Color.WHITE, false, 4.0)
			draw_circle(Vector2(-i * pip_separation, 0.0), pip_radius, Color.WHITE, true, 4.0)
		else:
			draw_circle(Vector2(i * pip_separation, 0.0), pip_radius, Color.WHITE, false, 4.0)
			draw_circle(Vector2(-i * pip_separation, 0.0), pip_radius, Color.WHITE, false, 4.0)
