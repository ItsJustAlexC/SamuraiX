extends Camera2D

var viewport : Vector2
var mouse_position : Vector2
var direction : Vector2
var x_axis_direction : float
var y_axis_direction : float

func _process(delta: float) -> void:
	
	viewport = get_viewport().size
	mouse_position = get_global_mouse_position()
	
	if (mouse_position.x >= -1 and mouse_position.x <= 5):
		
		x_axis_direction = -1
		
	elif (mouse_position.x <= viewport.x and mouse_position.x >= viewport.x - 5):
		
		x_axis_direction =  1
		
	else:
		
		x_axis_direction = 0
		
	if (mouse_position.y >= -1 and mouse_position.y  <= 5):
		
		y_axis_direction =  -1
		
	elif (mouse_position.y <= viewport.y and mouse_position.y >= viewport.y - 5):
		
		y_axis_direction =  1
		
	else:
		
		y_axis_direction = 0
		
	direction = Vector2(x_axis_direction, y_axis_direction).normalized()
	
	translate(direction * 2400 * delta) 
