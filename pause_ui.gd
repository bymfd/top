extends Control


func _ready():
	if global.skor==0:
		$restart.text="play"
	$skor.text=str(global.max_skor)
	if global.skor>global.max_skor:
		global.max_skordegis()
		$skor.text=str(global.max_skor)

	if !global.music:
		$ses.icon=load("res://assets/soundOff.png")
	else:
		$ses.icon=load("res://assets/sound.png")
func _on_Button_pressed():
	queue_free()
	get_tree().paused=false
	get_tree().change_scene("res://leveltemplate.tscn") 
	global.skor=0

func _on_ses_pressed():
	global.ses()
	if !global.music:
		$ses.icon=load("res://assets/soundOff.png")
	else:
		$ses.icon=load("res://assets/sound.png")




func _on_info_pressed():
	get_node("WindowDialog").visible=true


