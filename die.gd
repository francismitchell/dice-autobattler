class_name Die
extends RigidBody3D

@onready var initial_position: Vector3 = global_position
var toggle: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	roll()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# check die value only on the first frame where motion equals zero
	if toggle:
		if linear_velocity == Vector3.ZERO and angular_velocity == Vector3.ZERO:
			var x: int = round(global_rotation_degrees.x / 90)
			var z: int = round(global_rotation_degrees.z / 90)
			# determined empirically
			if x == 1:
				print('3')
			elif x == -1:
				print('4')
			elif z == 0:
				print('1')
			elif z == 1:
				print('2')
			elif z == -1:
				print('5')
			else:
				print('6')
			#print("x: ", round(rad_to_deg(global_rotation.x) / 90), ", z: ", round(rad_to_deg(global_rotation.z) / 90))
			toggle = false
	if linear_velocity != Vector3.ZERO:
		toggle = true

func roll() -> void:
	global_transform.origin = initial_position
	rotate_x(randf() * TAU)
	rotate_y(randf() * TAU)
	rotate_z(randf() * TAU)
	apply_impulse(Vector3.UP)
	apply_torque_impulse(0.01*rotation)
