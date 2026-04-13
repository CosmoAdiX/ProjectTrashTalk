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
		
		
func _process(_delta: float) -> void:
	Steam.run_callbacks()
	
