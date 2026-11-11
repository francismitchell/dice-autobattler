extends Label

var score: int = 0:
	set(value):
		score = value
		text = str(value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for die: Die in get_tree().get_nodes_in_group("Dice"):
		die.die_landed.connect(_on_die_landed)


func _on_die_landed(landed_on_value: int) -> void:
	score += landed_on_value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_roll_dice_button_pressed() -> void:
	score = 0
