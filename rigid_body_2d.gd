extends RigidBody2D

@onready var center_of_mass_position: Node2D = $CenterOfMassPosition

func _ready() -> void:
	center_of_mass = center_of_mass_position.position
