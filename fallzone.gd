extends Area3D


@warning_ignore("unused_parameter")
func _on_body_entered(body: Node3D) -> void:
	get_tree().reload_current_scene()
