extends Node

##显然，这是生命值组件的父节点。[br]
##也就是说，比如我要给[玩家]添加[生命值组件]，那么[生命值组件]所在的节点应当是[玩家]节点的第一级子节点
@onready var father_node = get_parent()

##[b][i][u][color=green]答案显而易见了[/color][/u][/i][/b]
##这个节点是生命值组件所附对象上的buff组件。考虑到有些对象可能不会有buff………………………………
@onready var buff_node = get_node("../Buff")

## [i]基础[/i]最大生命值 [br]
## 还有[i]实际[/i]最大值,详见[actual_max_health]。[br]
## 使用函数[method set_max_health]可以修改基础最大生命值
@export var max_health: float = 100.0

## [i]实际[/i]最大生命值 [br]
## 这个值是对象实实在在的最大生命值表现。
var actual_max_health: float = max_health

## 实际当前生命值 [br]
## 请不要使用脚本直接调用这个变量，可能导致生命值异常等安全性问题 [br] 
## 
@export var current_health: float = 0.0

## @experimental:目前而言，这个函数对当前生命值的操作还有待改进
## 设置基础最大生命值 [br]
## 参数[value] ：设置的值[br] 
## 参数[set_max_health_mode] ：设置的模式[br] 
## 模式：[br]
## 		"set" ：直接设置基础最大生命值(=value) [br] 
## 		"proportion" ：按比例设置基础最大生命值(*value) [br] 
##     "add" ：增加基础最大生命值(+value) [br] 
## 如果模式错误，函数会断言失败，等待开发人员修复代码。
func set_max_health(value: float, set_max_health_mode: String = "set") -> void:

	if current_health > value:
		current_health = value

	if set_max_health_mode == "set":
		max_health = value
	elif set_max_health_mode == "proportion":
		max_health *= value
	elif set_max_health_mode == "add":
		max_health += value
	else:
		assert(false, "set_max_health_mode 模式错误")
	return

## 获取当前生命值百分比 [br]
## 返回值：当前生命值占基础最大生命值的百分比 [br]
func get_health_percentage() -> float:
	return current_health / actual_max_health

## 治疗 [br]
## 参数[value] ：治疗的值[br] 
## 治疗后，如果当前生命值超过实际最大生命值，会自动设置为实际最大生命值。[br]
## @experimental
func treat(value: float)->void:
	current_health += value
	if current_health > actual_max_health:
		current_health = actual_max_health
	return





func _ready() -> void:
	if current_health == 0:
		current_health = max_health
	elif current_health > max_health:
		current_health = max_health
	#print("最大生命值：", max_health)
	#print("当前生命值：", current_health)
	#print("实际最大生命值：", actual_max_health)
	#print("当前生命值百分比：", get_health_percentage())
	print("buff节点：", buff_node)
	#print("父节点：", father_node)
	#print(father_node.get_movement_vector())
	
