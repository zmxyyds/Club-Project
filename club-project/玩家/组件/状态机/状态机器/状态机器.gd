class_name 状态机 extends Node

@export var 初状态 : 状态

var 状态们 : Dictionary= {}#设立字典，保存状态
var 当前状态 : 状态

func _ready():
	for state in get_children():
		if state is 状态:
			状态们[state.name.to_upper()] = state#获取所有状态，导入字典#注意名称或大小写
			state.update_state.connect(_on_update_state)#连接状态名
			
	if 初状态:
		初状态.enter()#
	当前状态 = 初状态#调用初状态

func _process(delta):
	if 当前状态:
		当前状态.update(delta)#更新

func _physics_process(delta):
	if 当前状态:
		当前状态.physics_update(delta)#物理更新，注意区分



func _on_update_state(状态名):
	
	if 状态名==当前状态.name:
		return#避免重复调用
	var 新状态 : 状态 = 状态们[状态名.to_upper()]#字典拿取状态
	if 当前状态:#判断是否有当前状态，如果有，进行退出
		当前状态.exit()
	新状态.enter()
	当前状态 = 新状态
