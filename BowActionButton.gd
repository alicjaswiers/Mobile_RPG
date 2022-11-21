extends "res://Resources/ActionButton.gd"

const Bow = preload("res://Resources/Images/Animations/Bow.tscn")

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	if enemy != null and playerStats != null:
		create_bow(enemy.global_position)
		enemy.take_damage(3)
		playerStats.mp += 4
		playerStats.ap -= 1
		
func create_bow(position):
	var bow = Bow.instance()
	var main = get_tree().current_scene
	main.add_child(bow)
	bow.global_position = position
