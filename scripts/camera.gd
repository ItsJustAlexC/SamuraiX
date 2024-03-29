extends Camera2D

var direction : Vector2
var x_axis_direction : float
var y_axis_direction : float

func _process(delta: float) -> void:
	x_axis_direction = Input.get_axis("ui_left", "ui_right")
	
	y_axis_direction = Input.get_axis("ui_up", "ui_down")
	
	direction = Vector2(x_axis_direction, y_axis_direction)
	
	translate(direction * 600 * delta)
	
