extends Node2D
class_name PreviewTest


## 这是一个文档注释
## 多行也没问题

# 这是普通注释

signal health_changed(new_value: int)
signal game_over


const MAX_SPEED = 1000.0
const ID_STRING: StringName = &"player_id"
const PATH_NODE = $"../Enemy"
const NODE_PATH: NodePath = ^"UI/ScoreLabel"


@export var speed: float = 300.5
@export_range(1, 10) var level: int = 1
@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = %GameTitle


var _private_var = 0
var positions: Array[Vector2] = []
var enemies: Array[Node2D] = []


func _ready() -> void:
	print("游戏启动")
	push_warning("这是一个警告")
	
	speed = clamp(speed, 0.0, MAX_SPEED)
	
	var rng = randf_range(-1.0, 1.0)
	var hex_num = 0xFF_00_FF
	var bin_num = 0b1010_0101
	
	# 字符串中的转义序列不会被误高亮
	var path_str = "$Sprite2D"
	
	if level > 5:
		_private_method()
	elif speed < 100.0:
		move()
	else:
		await get_tree().create_timer(1.0).timeout


func move(direction: Vector2 = Vector2.ZERO) -> void:
	var target = position + direction * speed
	position = target
	
	emit_signal("health_changed", 10)
	
	for i in range(3):
		var msg = "Count: {0}".format([i])
		print(msg)


func _private_method() -> void:
	pass


func match_example(value) -> String:
	match value:
		0:
			return "zero"
		"hello":
			return "greeting"
		_ :
			return "unknown"


class InnerClass:
	var data: int = 0
	
	func process() -> void:
		pass