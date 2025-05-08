extends Area3D

var safe
func _on_body_entered(body: Node3D) -> void:
	if safe == true:
		$Player.position.x = 247
		$Player.position.y = 16
		$Player.position.z = -40
