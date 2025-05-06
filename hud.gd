extends CanvasLayer




func _on_area_3d_body_entered(body: Node3D) -> void:
	
	if body.name == "Player":
	
		$teacher.text = "Don't touch it!!!!"


func _on_area_3d_2_body_entered(body: Node3D) -> void:
	
	if body.name == "Player":
	
		$teacher.text = "Good Job! 
		now go eat that cake to go to the next level."
