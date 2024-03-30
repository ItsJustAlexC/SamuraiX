class_name PlayerMovementComponent
extends MovementComponent

@export var player : CharacterBody2D
var click_position : Vector2
var target_position : Vector2

func _process(delta: float) -> void:
	
	if player.position.distance_to(click_position) > 10:
		
		target_position = (click_position - player.position).normalized()
		
		player.velocity = target_position * 350 * delta
		
		player.move_and_collide(player.velocity)
