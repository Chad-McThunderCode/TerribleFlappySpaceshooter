extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position + Vector2(500*delta, 0).rotated(rotation)
	if(global_position.x > 1500 or global_position.x < -100):
		queue_free()


func _on_area_2d_area_entered(area):
	global_position = Vector2(-10000, 0)
