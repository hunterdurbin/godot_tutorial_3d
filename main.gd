extends Node

@export var mob_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mob_timer_timeout() -> void:
	const Mob = preload("res://mob.gd")
	var mob : Mob = mob_scene.instantiate() as Mob
	
	var mob_spawn_location : PathFollow3D = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	const Player = preload("res://player.gd")
	var player : Player = $Player as Player
	
	mob.initialize(mob_spawn_location.position, player.position)
	
	add_child(mob)
