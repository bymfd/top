extends Node
onready var a = get_node("MeshInstance")
onready var player=get_node("top")
var max_sol =-1
var max_sag=1
var speed=3
signal yan
var sola =true
var dur =false
var stackse =0
onready var stacks=[$MeshInstance,$MeshInstance2,$MeshInstance3,$MeshInstance4,$MeshInstance5,$MeshInstance6,$MeshInstance7]
var stack_boyut=Vector3(1,1,0.5)
func _physics_process(_delta):
	if  a.global_transform.origin.x <= max_sol :
		sola=false
	if  a.global_transform.origin.x >= max_sag :
		sola=true
	a.scale.x=stack_boyut.x
	if !dur:
		if sola:
			a.global_transform.origin.x-=_delta*speed
		else:
			a.global_transform.origin.x+=_delta*speed
func _input(event):
	if event.is_action_pressed("ui_click") :

		if global.music:
			$tok.play(0.0)
		if stack_boyut.x - abs(a.global_transform.origin.x) >0 and !dur:
			stack_boyut.x = stack_boyut.x -abs(a.global_transform.origin.x)
			a.transform.origin.x=0
			if (stack_boyut.x - abs(a.global_transform.origin.x))== stack_boyut.x and stack_boyut.x <1.0  :
				stack_boyut.x+=0.1
		else :
			emit_signal("yan")
			dur=true
			a.transform.origin.x=0
		stacksec(stackse+1)

func sag():
	pass

func stacksec(i):
	if i>6:
		i=0
	stacks[i].translation.z=stacks[i].translation.z+(7.16)
	a=stacks[i]
	stackse=i
	a.get_surface_material(0).albedo_color=global.renk_degis()
	


func _on_Area_body_entered(body):
	if body.name !="StaticBody":
		global.skora()
		$point.transform.origin.z+=10
