"""
Acts as the script that handles the game process in the game
board scene
"""

extends Node
var mouse_offset = null
var zoom_level = Vector2(0.5, 0.5)

func _ready():
	print("Mouse Offset:",mouse_offset)


func _process(delta):
	mouse_offset = (get_viewport().get_mouse_position() - Vector2(get_viewport().size.x, get_viewport().size.y) / 2)
	$Camera2D.position = lerp(Vector2(), mouse_offset.normalized() * 500, mouse_offset.length() / 1000)
	$Camera2D.zoom = zoom_level


func _input(event):
	if event.is_action_pressed("zoom_in"):
		zoom_level += Vector2(0.05, 0.05)
		
	elif event.is_action_pressed("zoom_out"):
		zoom_level -= Vector2(0.05, 0.05)
