extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.name == "ball":
		get_tree().change_scene_to_file("res://level_2.tscn")
