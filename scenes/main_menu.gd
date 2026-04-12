
extends CanvasLayer
class_name MainMenu

@onready var host_button: Button = %Host
@onready var exit_button: Button = %Exit

#Preloads
const Host_Lobby = preload("uid://xmpjpx0p1lfq")

func _ready() -> void:
	SceneManager.register_main_menu(self)
	host_button.pressed.connect(func(): SceneManager.push_screen("host_lobby"))
	exit_button.pressed.connect(func(): get_tree().quit())
	

	
