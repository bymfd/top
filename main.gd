extends Node
onready var a = get_node("MeshInstance")
onready var player=get_node("top")
var max_sol =-1
var max_sag=1
var speed=0.5
var sola =true
var dur =false
var last
var stackse =0
onready var stacks=[$MeshInstance,$MeshInstance2,$MeshInstance3,$MeshInstance4,$MeshInstance5]
var stack_boyut=Vector3(1,1,0.5)
func _physics_process(delta):
	if  a.global_transform.origin.x <= max_sol :
		sola=false
	if  a.global_transform.origin.x >= max_sag :
		sola=true
	sag()
	a.scale.x=stack_boyut.x
	

	
	
	
func _input(event):


	if event.is_action_pressed("ui_click"):
		VisualServer.set_default_clear_color(global.renk_degis())
		a.get_surface_material(0).albedo_color=global.renk_degis()
		print("event çalıştı")
		if stack_boyut.x - abs(a.global_transform.origin.x) >0 and !dur:
			stack_boyut.x = stack_boyut.x -abs(a.global_transform.origin.x)
			a.transform.origin.x=0
			if (stack_boyut.x - abs(a.global_transform.origin.x))== stack_boyut.x:
				stack_boyut.x+=0.1
		else :
			print("bitti")
			dur=true
			a.transform.origin.x=0
		stacksec(stackse+1)



func sag():
	if !dur:
		if sola:
			a.global_transform.origin.x-=0.1*speed
		else:
			a.global_transform.origin.x+=0.1*speed

func stacksec(i):
	if i>4:
		i=0
	stacks[i].translation.z=stacks[i].translation.z+(5.10)
	a=stacks[i]
	print(i)
	print(stacks[i])
	stackse=i


