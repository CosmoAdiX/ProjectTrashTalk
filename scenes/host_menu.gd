extends CanvasLayer

@onready var back_button_host: Button = %Back

func _ready() -> void:
	
	back_button_host.pressed.connect(func(): SceneManager.pop_screen())
	
