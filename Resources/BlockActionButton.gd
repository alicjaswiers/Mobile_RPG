extends "res://Resources/ActionButton.gd"

const Regen = preload("res://Resources/Images/Animations/Regen.tscn")

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	if playerStats != null:
		if playerStats.mp >= 1:
			if playerStats.ap == 3:
				create_regen(enemy.global_position)
				playerStats.ap -= 3
				playerStats.mp += 8

func create_regen(position):
	var regen = Regen.instance()
	var main = get_tree().current_scene
	main.add_child(regen)
	regen.global_position = position
