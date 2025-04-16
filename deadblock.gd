extends Area3D

var moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving == true:
		position.y -= 10


func _on_body_entered(body):
		if body.name == "player":
			get_tree().reload_current_scene()


func _on_area_3d_body_entered(body):
	moving = true
