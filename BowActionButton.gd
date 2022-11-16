extends "res://Resources/ActionButton.gd"

const Slash = preload("res://Resources/Slash.tscn")

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	if enemy != null and playerStats != null:
		create_slash(enemy.global_position)
		enemy.take_damage(3)
		playerStats.mp += 4
		playerStats.ap -= 1
		
func create_slash(position):
	var slash = Slash.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position