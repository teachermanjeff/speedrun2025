extends Area3D

func _on_area_entered(area: Area3D) -> void:
	
	get_tree().change_scene_to_file("res://Tutorial.tscn")
