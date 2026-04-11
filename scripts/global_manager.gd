extends Node

enum GAMEPHASE { LOBBY, QUESTION, RESULTS }

signal phase_changed(new_phase)

var current_phase: GAMEPHASE = GAMEPHASE.LOBBY:
	set(value):
		current_phase = value
		phase_changed.emit(current_phase)
		print("Phase changed to: ", GAMEPHASE.keys()[current_phase])
