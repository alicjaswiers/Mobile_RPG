extends "res://Resources/ActionButton.gd"

const Heal = preload("res://Resources/Images/Animations/Heal.tscn")

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	if playerStats != null:
		if playerStats.mp >= 8:
			create_heal(enemy.global_position)
			playerStats.hp += 5
			playerStats.ap -= 1
			playerStats.mp -= 8

func create_heal(position):
	var heal = Heal.instance()
	var main = get_tree().current_scene
	main.add_child(heal)
	heal.global_position = position
