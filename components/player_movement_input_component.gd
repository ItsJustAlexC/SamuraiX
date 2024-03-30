class_name PlayerMovementInputComponent
extends Node2D

@export var player_movement_component : PlayerMovementComponent

var click_position : Vector2

func _input(_event: InputEvent) -> void:
	
	if Input.is_action_just_released("right_click"):
		
		click_position = get_global_mouse_position()
		
	player_movement_component.click_position = click_position
