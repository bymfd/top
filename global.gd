extends Node
var skor=0
var max_skor=0
var renk=0
var music =true
var path="user://settings.save"
var data={"music":false,"skor":1}
signal skor_degis

func _ready():
	var f = File.new()
	if f.file_exists(path):
		f.open(path, File.READ)
		data = f.get_var()
		f.close()
		max_skor=data["skor"]
		music=data["music"]
		return data
	else:
		yaz()
	
func max_skordegis():
	max_skor=skor
	yaz()

func ses():
	music=!music
	yaz()
func renk_degis():
	renk+=1
	if renk<=5:
		#VisualServer.set_default_clear_color(ColorN("burlywood"))
		return ColorN("slategray")

	elif renk <= 10:
#		VisualServer.set_default_clear_color(ColorN("darkgray"))
		return ColorN("tomato")
	elif renk <= 15:
#		VisualServer.set_default_clear_color(ColorN("darkkhaki"))
		return ColorN("sienna")
	else:
		renk=0
		return ColorN("slategray")
func skora():
	skor+=1
	emit_signal("skor_degis")



func yaz():
	data["music"]=music
	data["skor"]=max_skor
	var f = File.new()
	f.open(path, File.WRITE)
	f.store_var(data)
	max_skor=data["skor"]
	music=data["music"]
	f.close()
