extends CharacterBody3D

const  ROLLspeed = deg_to_rad(5)
var speed = 10
# Called when the node enters the scene tree for the first time.
const jumpspeed = 100
const gravity = 2
var sensitivity = 150
var double_jump = 1
var time_for_doublejump = 10
var check_point

func _on_timer_timeout():
	time_for_doublejump -= 1
	if not is_on_floor():
		if time_for_doublejump == 0:
			double_jump = 0
	print("double_jump")

	
func _process(_delta):
	#restart
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	#quit the game
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
		print("quit")
	if Input.is_action_pressed("editmap"):
		if Input.is_action_pressed("jump"):
			velocity.y = jumpspeed
		else:
			velocity.y = 0
	else:
		velocity.y = velocity.y - gravity
		if double_jump > 0:
			if Input.is_action_just_pressed("jump"):
				velocity.y = jumpspeed
				double_jump -= 1
				print(double_jump)
		if is_on_floor():
			double_jump = 1

		
	#movement
	if Input.is_action_pressed("right"):
		velocity.z = speed * global_transform.basis.x.z
		velocity.x = speed * global_transform.basis.x.x
		
		$MeshInstance3D.rotate_z (-ROLLspeed)

	elif Input.is_action_pressed("left"):
		velocity.z = -speed * global_transform.basis.x.z
		velocity.x = -speed * global_transform.basis.x.x
		$MeshInstance3D.rotate_z (ROLLspeed)

	elif Input.is_action_pressed("forward"):
		velocity.z = -speed * global_transform.basis.z.z
		velocity.x = -speed * global_transform.basis.z.x

		$MeshInstance3D.rotate_x (-ROLLspeed)
	elif Input.is_action_pressed("backward"):
		velocity.z = speed * global_transform.basis.z.z
		velocity.x = speed * global_transform.basis.z.x
		$MeshInstance3D.rotate_x (ROLLspeed)
	
	else:
		velocity.z = 0
		velocity.x = 0
	
	
	if position.y < -10:
		
		get_tree().reload_current_scene()
	
	move_and_slide()
	
	if check_point == true:
		position.x =295.671
		position.y =2.484
		position.z =-53.428
		check_point == false
	
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y += event.relative.x / -sensitivity
		rotation.x += event.relative.y / - sensitivity
		rotation.x = clampf(rotation.x,-0.75,0.75)


func _on_teleportation_body_entered(body: Node3D) -> void:
	position.x =295.671
	position.y =2.484
	position.z =-53.428
