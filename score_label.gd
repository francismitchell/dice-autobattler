extends Label

@export var cam: Camera3D

var score: int = 0:
	set(value):
		score = value
		text = str(value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for die: Die in get_tree().get_nodes_in_group("Dice"):
		die.die_landed.connect(_on_die_landed)


func _on_die_landed(die_global_position: Vector3, landed_on_value: int) -> void:
	var travel_time: float = 1.0 + randf()
	get_tree().create_timer(travel_time).timeout.connect(func(): score += landed_on_value)
	var screen_pos: Vector2 = cam.unproject_position(die_global_position)
	var label: Label = Label.new()
	label.text = str(landed_on_value)
	label.position = screen_pos
	print(screen_pos)
	get_tree().root.add_child(label)
	create_tween().tween_property(label, "position", position, travel_time).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT).finished.connect(label.queue_free)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_roll_dice_button_pressed() -> void:
	score = 0
