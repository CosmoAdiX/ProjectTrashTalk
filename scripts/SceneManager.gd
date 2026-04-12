extends Node


var main_menu: CanvasLayer
var screen_stack: Array[CanvasLayer] = []

const Screens = {
	"host_lobby": preload("uid://xmpjpx0p1lfq"),	
}

func register_main_menu(node: CanvasLayer):
	main_menu = node
	
#Push a new scree on top of the current ui
func push_screen(screen_name: String):
	if screen_stack.is_empty():
		main_menu.hide()
	
	else:
		screen_stack.back().hide()
		
	var new_screen = Screens[screen_name].instantiate()
	get_tree().current_scene.add_child(new_screen)
	screen_stack.append(new_screen)

func pop_screen():
	if screen_stack.is_empty():
		return
	
	var top = screen_stack.back()
	screen_stack.pop_back()
	top.queue_free()
	
	if screen_stack.is_empty():
		main_menu.show()
	else:
		screen_stack.back().show()
		
func pop_all():
	for screen in screen_stack:
		screen.queue_free()
	screen_stack.clear()
	main_menu.show()
