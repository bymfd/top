extends KinematicBody
var gravity =Vector3.DOWN *100
var speed =95
var velocity = Vector3()
signal yan 
onready var player = $CollisionShape/MeshInstance
func _physics_process(delta):
	velocity=gravity*delta

	player.rotate_x(speed*0.01/3)
	velocity.z +=delta*speed
	velocity=move_and_slide(velocity,Vector3.FORWARD)
	if player.global_transform.origin.y<-1:
		queue_free()
		get_tree().change_scene("res://pause_ui.tscn")

