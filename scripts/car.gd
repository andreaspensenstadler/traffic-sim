extends Node2D

enum State { MOVING, STOPPING }

var state: State = State.MOVING

const SPEED := 200.0
const REACTION_MIN := 0.2
const REACTION_MAX := 0.7

var blocking_light: Node2D = null
var stopping: bool
var reaction_pending: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ViewArea.area_entered.connect(_on_view_area_entered)
	$ViewArea.area_exited.connect(_on_view_area_exited)
	$StopArea.area_entered.connect(_on_stop_area_entered)
	$StopArea.area_exited.connect(_on_stop_area_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_update_state()
	_act(delta)

func _update_state() -> void:
	if blocking_light and not blocking_light.is_green and stopping:
		_set_state(State.STOPPING, "Traffic light in view area is red")
	elif state == State.STOPPING and not reaction_pending:
		reaction_pending = true
		_react(func(): _set_state(State.MOVING, "Reaction time passed, traffic light is green"))

func _set_state(new_state: State, reason: String) -> void:
	if state == new_state:
		return
	state = new_state
	print("Car '%s': state -> %s (%s)" % [name, State.keys()[new_state], reason])

func _act(delta: float) -> void:
	if state == State.MOVING:
		position.x += SPEED * delta

func _on_view_area_entered(area: Area2D) -> void:
	blocking_light = area.get_parent()

func _on_stop_area_entered(_area: Area2D) -> void:
	stopping = true

func _react(callable: Callable) -> void:
	await get_tree().create_timer(randf_range(REACTION_MIN, REACTION_MAX)).timeout
	callable.call()
	reaction_pending = false

func _on_view_area_exited(_area: Area2D) -> void:
	pass

func _on_stop_area_exited(area: Area2D) -> void:
	if area.get_parent() == blocking_light:
		blocking_light = null
		stopping = false
