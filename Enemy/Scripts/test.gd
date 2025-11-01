extends Node

# GDScript 脚本：访问 C# 的 Health 组件，并进行交互
# 功能需求：
# 1) 访问 Health 组件
# 2) 输出 MaxHealth（题中拼写为 maxHealeh，这里按实际属性名 MaxHealth）
# 3) 将当前生命值设置为 50
# 4) 调用 C# 的 Test 方法并输出返回值

# onready 获取 Health 组件所在的节点：
# 当前场景结构中，test.gd 挂在名为 "Node" 的子节点上；
# Health.cs 脚本（C#）挂在父节点（Node2D）上，因此直接通过 get_parent() 访问。
@onready var health_node: Node = get_parent()

func _ready() -> void:
	# 进入场景后依次执行四个步骤
	if health_node == null:
		# 如果父节点不存在，提示错误并退出
		push_error("未找到 Health 组件：父节点为空")
		return

	# 1) 访问 Health 组件 —— 此处即为取得 health_node 引用
	#    为了清晰，仍调用封装方法进行一次校验
	var h := get_health()
	if h == null:
		push_error("未找到 Health 组件：get_health() 返回为空")
		return

	# 2) 输出 MaxHealth（跨语言访问 C# 属性，推荐使用 get("属性名") 方式）
	print_max_health()

	# 3) 将当前生命值设置为 50（同样使用 set("属性名", 值) 方式）
	set_current_health(50.0)

	# 4) 调用 Test 并输出返回值（枚举参数使用默认值，避免在 GDScript 中直接引用 C# 枚举）
	var ret := call_test(50.0)
	print("Test 返回: ", ret)

# 模块化封装：获取 Health 组件节点
func get_health() -> Node:
	# 这里返回父节点（即挂载了 C# Health.cs 的节点）
	return health_node

# 模块化封装：打印最大生命值
func print_max_health() -> void:
	var node := get_health()
	if node:
		# 使用 get("MaxHealth") 访问 C# 的公开属性 MaxHealth
		var max_health: Variant = node.get("MaxHealth")
		print("MaxHealth = ", max_health)
	else:
		push_error("Health 节点不存在，无法打印 MaxHealth")

# 模块化封装：设置当前生命值
func set_current_health(value: float) -> void:
	var node := get_health()
	if node:
		# 使用 set("CurrentHealth", 值) 设置 C# 公开属性 CurrentHealth
		node.set("CurrentHealth", value)
		print("已将当前生命值设置为: ", value)
	else:
		push_error("Health 节点不存在，无法设置 CurrentHealth")

# 模块化封装：调用 C# 的 Test 方法并返回字符串
func call_test(value: float) -> String:
	var node := get_health()
	if node:
		# 直接调用 C# 方法 Test(value)
		# 第二个参数是 C# 的枚举，GDScript 直接调用时可省略，使用默认值
		var ret: String = str(node.call("Test", value))
		return str(ret)
	else:
		push_error("Health 节点不存在，无法调用 Test")
		return ""
