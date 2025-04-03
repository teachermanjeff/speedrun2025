extends CharacterBody3D

var MOVESPEED = 8

const ROLLSPEED = deg_to_rad(8.5)

const GRAVITY = 1

var JUMPSPEED = 15

const MOUSESENSITIVITY = 0.01 # set mouse sensitivity

func _ready():

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # make you mouse can't move around

func _unhandled_input(event):

	if event is InputEventMouseMotion:

		rotation.y = rotation.y - event.relative.x * MOUSESENSITIVITY 

# make mouse look work 

func _process(_delta):

# make mouse move work with moving character

	if Input.is_action_just_released("exit"):

		get_tree().quit()

	velocity.y = velocity.y - GRAVITY

	if Input.is_action_just_pressed("jump") and is_on_floor():

		velocity.y = JUMPSPEED

	if Input.is_action_pressed("forward"):

		velocity.z = -MOVESPEED * global_transform.basis.z.z

		velocity.x = -MOVESPEED * global_transform.basis.z.x

		$MeshInstance3D.rotate_x(-ROLLSPEED)

	elif Input.is_action_pressed("backward"):

		velocity.z = MOVESPEED * global_transform.basis.z.z

		velocity.x = MOVESPEED * global_transform.basis.z.x

		$MeshInstance3D.rotate_x(ROLLSPEED)

	elif Input.is_action_pressed("right"):

		velocity.x = MOVESPEED * global_transform.basis.x.x

		velocity.z = MOVESPEED * global_transform.basis.x.z

		$MeshInstance3D.rotate_z(-ROLLSPEED)

	elif Input.is_action_pressed("left"):

		velocity.x = -MOVESPEED * global_transform.basis.x.x

		velocity.z = -MOVESPEED * global_transform.basis.x.z

		$MeshInstance3D.rotate_z(ROLLSPEED)

	else:# stop

		velocity.x = 0

		velocity.z = 0

	move_and_slide()
