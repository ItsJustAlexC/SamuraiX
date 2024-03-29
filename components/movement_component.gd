class_name MovementComponent
extends Node2D

@export var entity : CharacterBody2D
var click_position : Vector2
var target_position : Vector2

func _process(delta: float) -> void:
	if entity.position.distance_to(click_position) > 5:
		
		target_position = (click_position - entity.position).normalized()
		
		entity.velocity = target_position * 350 * delta
		
		entity.move_and_collide(entity.velocity)
