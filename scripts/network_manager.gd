extends Node

var peer = SteamMultiplayerPeer.new()

var current_lobby_id = 0

var _pending_lobby_name: String = ""
var _pending_player_amount: int = 0
var _pending_lobby_type: int = Steam.LOBBY_TYPE_PUBLIC

func _ready() -> void:
	OS.set_environment("SteamAppId", "480")
	OS.set_environment("SteamGameId", "480")
	
	#initializing shits
	Steam.steamInit()
	
	# Check weather the shit is working or not
	var is_running = Steam.isSteamRunning()
	
	if not is_running:
		printerr("Steam is Not running mate tf you doing? Open your fking steam mate!!!")
	else:
		print("Fuck mate we ball!!!, Hmm so your name is: " + Steam.getPersonaName())
		


func _process(_delta: float) -> void:
	Steam.run_callbacks()
	

func host_game(lobby_name: String, player_amount: int, lobby_type: int):
	print("Attempting To Host...")
	var bro: String
	_pending_lobby_name = lobby_name
	_pending_player_amount = player_amount
	_pending_lobby_type = lobby_type
	
	peer.create_host(0)
	
	multiplayer.multiplayer_peer = peer
	
	# Tell steam to make a fking lobby
	Steam.createLobby(lobby_type, player_amount)
	
	Steam.lobby_created.connect(_on_lobby_created)
	
func _on_lobby_created(connect_result, lobby_id):
	if connect_result == 1:
		print("The lobby was created!...")
		current_lobby_id = lobby_id
		
		# Set lobby name
		Steam.setLobbyData(lobby_id, "name", _pending_lobby_name)
		
		# allow people to join the lobby
		Steam.setLobbyJoinable(lobby_id, true)
		
		# helps the "Join Game" Button to work
		Steam.setRichPresence("connect", "+connect_lobby" + str(lobby_id))
		
	else:
		printerr("Lobby creation failed with code: " +str(connect_result))
		

	
		
		
		
