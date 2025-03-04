extends Node

var global_save_path = "user://saves/"

func save_(data:Dictionary,data_name:String,save_path:String=global_save_path)->void:
	if !DirAccess.dir_exists_absolute(save_path):
		DirAccess.make_dir_recursive_absolute(save_path)
	var file = FileAccess.open(save_path+data_name,FileAccess.WRITE)
	file.store_var(data)
	file.close()
	
func load_(data_name:String,save_path:String=global_save_path):
	if !DirAccess.dir_exists_absolute(save_path):
		return
	if !FileAccess.file_exists(save_path+data_name):
		return 
	var file = FileAccess.open(save_path+data_name,FileAccess.READ)
	var data =file.get_var()
	return data
