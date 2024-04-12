extends Camera2D

var mouse_position : Vector2
var mouse_global_position : Vector2
var start : Vector2
var start_vector : Vector2
var end : Vector2
var end_vector : Vector2
var is_dragging : bool = false
signal area_selected
signal start_move_selection

@onready var UI : CanvasLayer = $".."
var selector_box : Panel

func _ready() -> void:
	
	pass

func _process(delta: float) -> void:
	
	#print(selector_box)
	
	if Input.is_action_just_pressed("left_click"):
		
		start = mouse_global_position
		
		start_vector = mouse_position
		
		is_dragging = true
		
		selector_box = Panel.new()
	
		UI.add_child(selector_box)
		
	if is_dragging:
		
		end = mouse_global_position
		
		end_vector = mouse_position
		
		draw_area()
		
		for child in selector_box.get_children():
			print(child.name)
		
	if Input.is_action_just_released("left_click"):
		
		if start_vector.distance_to(mouse_position) > 20:
			
			end = mouse_global_position
			
			end_vector = mouse_position
			
			is_dragging = false
			
			selector_box.visible = false
			
			draw_area(false)
			
			emit_signal("area_selected")
			
		else:
			
			end = start
			
			is_dragging = false
			
			selector_box.visible = false
			
			draw_area(false)
			
func _input(event):
	
	if event is InputEventMouse:
		
		mouse_position = event.position
		
		mouse_global_position = get_global_mouse_position()
		
func draw_area(s=true):
	
	selector_box.size = Vector2(abs(start_vector.x - end_vector.x), abs(start_vector.y - end_vector.y))
	
	var pos = Vector2()
	
	pos.x = min(start_vector.x, end_vector.x)
	
	pos.y = min(start_vector.y, end_vector.y)
	
	selector_box.position = pos
	
	selector_box.size *= int(s)
