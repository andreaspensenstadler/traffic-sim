extends Node2D

const CarScene := preload("res://scenes/car.tscn")

func _ready() -> void:
	var car := CarScene.instantiate()
	car.position = Vector2(-400, 0)
	add_child(car)
