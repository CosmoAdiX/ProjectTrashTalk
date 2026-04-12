extends CanvasLayer

@onready var back_button_host: Button = %Back

func _ready() -> void:
	
	back_button_host.pressed.connect(on_back_pressed)
	
func on_back_pressed():
	get_tree().current_scene.remove_child()
	
