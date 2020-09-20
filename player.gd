extends KinematicBody
var gravity =Vector3.DOWN *20
var speed =50
var velocity = Vector3()
onready var player = $CollisionShape/MeshInstance

func _physics_process(delta):
	velocity=gravity*delta
	velocity=move_and_slide(velocity,Vector3.UP)
	player.rotate_x(speed*delta)
	velocity.z +=delta*speed
	velocity=move_and_slide(velocity,Vector3.FORWARD)

	if player.global_transform.origin.y<-0.5:
		queue_free()
		get_tree().change_scene("res://pause_ui.tscn")
