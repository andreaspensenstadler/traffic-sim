extends Node2D

signal changed(is_green: bool)

var is_green := false
@onready var light: ColorRect = $Light
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("traffic_lights")
	_cycle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _cycle() -> void:
	while true:
		#await get_tree().create_timer(3.0).timeout
		await get_tree().create_timer(randf_range(0.5, 1.2)).timeout
		
		is_green = not is_green
		light.color = Color.GREEN if is_green else Color.RED
		changed.emit(is_green)
