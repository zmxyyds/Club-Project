extends Node

# 用于访问 C# Health 组件的引用
var health_component: Node

func _ready() -> void:
	health_component = get_health_component()
	assert(health_component != null, "Health组件不存在")
		



func get_health_component() -> Node:
	# 获取节点的唯一子节点
	if get_child_count() > 0:
		var child = get_child(0)
		return child
	return null
