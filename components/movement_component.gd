class_name MovementComponent
extends Node2D

@export var entity : Node2D
@export var velocity : Vector2
@export var SPEED : float

func _ready() -> void:
	
	velocity = Vector2(0, 0)
	
	SPEED = 250
	
func _process(delta: float) -> void:
	
	entity.translate(velocity * SPEED * delta)
