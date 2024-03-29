class_name MovementInputComponent
extends Node2D

@export var movement_component : MovementComponent

var click_position : Vector2

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_released("left_click"):
		
		click_position = get_global_mouse_position()
		
	movement_component.click_position = click_position
