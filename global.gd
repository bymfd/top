extends Node


func _ready():
	renk_degis()

func renk_degis():
	return  Color(randf(), randf(), randf())

func back_renk():
	return Color(randf(), randf(), randf())
