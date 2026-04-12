
extends CanvasLayer

@onready var exit_button: Button = %Exit

func _ready() -> void:
	
	exit_button.pressed.connect(func(): get_tree().quit())
