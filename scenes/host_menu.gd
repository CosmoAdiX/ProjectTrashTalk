extends CanvasLayer

@onready var back_button_host: Button = %Back
@onready var lobby_name: LineEdit = %LobbyName
@onready var host_button: Button = %HostButton
@onready var player_amount: LineEdit = %PlayerAmount
@onready var lobby_type: OptionButton = %LobbyType



func _ready() -> void:
	
	back_button_host.pressed.connect(func(): SceneManager.pop_screen())
	host_button.pressed.connect(on_host_pressed)
	
	
func on_host_pressed() -> void:
	var lobby_name_1 = lobby_name.text.strip_edges()
	var amount_1 = int(player_amount.text.strip_edges())
	var type_of_lobby_1 = get_lobby_type()
	
	NetworkManager.host_game(lobby_name_1, amount_1, type_of_lobby_1)

func get_lobby_type() -> int:
	match lobby_type.selected:
		0: return Steam.LOBBY_TYPE_PUBLIC
		1: return Steam.LOBBY_TYPE_PRIVATE
		_: return Steam.LOBBY_TYPE_PUBLIC
