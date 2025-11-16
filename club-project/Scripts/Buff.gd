## buff组件[br]
##这个组件并不会提供什么buff效果，它只是帮助整理buff效果
extends Node

@onready var health = get_node("../Health")

## 所有会更改最大生命值的buff提供的函数都存在这里
var maxHealthModification: Array = []
## 用于向[member Buff.maxHealthModification]里面添加函数
func AddMaxHealthModification(function: Callable) -> void:
	if function == null:
		return
	if function in maxHealthModification:
		return
	maxHealthModification.append(function)
	
func UpdateMaxHealth() -> void:
	var maxhealth = health.max_health
	for function in maxHealthModification:
		maxhealth = function.call(maxhealth)
	health.SetActualMaxHealth(maxhealth)
