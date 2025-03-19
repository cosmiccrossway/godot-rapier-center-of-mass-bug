extends Node2D

enum ThrusterSide {
	left,
	right
}

@export var thruster_side: ThrusterSide
@export var thruster_force: Vector2

var _rigid_body: RigidBody2D


func _ready() -> void:
	if get_parent() is RigidBody2D:
		_rigid_body = get_parent() as RigidBody2D


func _physics_process(_delta: float) -> void:
	var thrust_multiplier: int = 0
	
	if Input.is_action_pressed("forward"):
		thrust_multiplier += 1
	
	if thruster_side == ThrusterSide.left and Input.is_action_pressed("right"):
		thrust_multiplier += 1
	elif thruster_side == ThrusterSide.right and Input.is_action_pressed("left"):
		thrust_multiplier += 1
	
	if thrust_multiplier > 0:
		var thrust_force: Vector2 = thruster_force.rotated(global_rotation) * thrust_multiplier
		var thrust_position: Vector2 = position.rotated(global_rotation)
		_rigid_body.apply_force(thrust_force, thrust_position)
