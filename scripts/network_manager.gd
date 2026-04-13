extends Node

var peer = SteamMultiplayerPeer.new()


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
		
	Steam.lobby_created.connect(_on_lobby_created)
		


func _process(_delta: float) -> void:
	Steam.run_callbacks()
	

func host_game():
	print("Attempting To Host...")
	
	peer.create_host(0)
	
	multiplayer.multiplayer_peer = peer
	
	# Tell steam to make a fking lobby
	Steam.createLobby(Steam.LOBBY_TYPE_PRIVATE, 8)
	
func _on_lobby_created(connect_result, lobby_id):
	if connect_result == 1:
		print("The lobby was created!...")
		
		# Set lobby name
		Steam.setLobbyData(lobby_id, "name", str(Steam.getPersonaName()) + "'s Lobby")
		
		# allow people to join the lobby
		Steam.setLobbyJoinable(lobby_id, true)
		
		# helps the "Join Game" Button to work
		Steam.setRichPresence("connect", "+connect_lobby" + str(lobby_id))
		
		
		
		
		
