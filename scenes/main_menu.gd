
extends CanvasLayer

@onready var host_button: Button = %Host
@onready var exit_button: Button = %Exit

#Preloads
const Host_Lobby = preload("uid://xmpjpx0p1lfq")

func _ready() -> void:
	
	host_button.pressed.connect(host_lobby)
	exit_button.pressed.connect(func(): get_tree().quit())
	
func host_lobby():
	var host_lobby_1 = Host_Lobby.instantiate()
	get_tree().current_scene.add_child(host_lobby_1)
	hide()
	
