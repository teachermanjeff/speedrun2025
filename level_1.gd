extends Node3D

func _ready() -> void:
	pass


func _on_timer_timeout() -> void:
	$Label.text = ""


func _on_goal_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://win_screen.tscn")
