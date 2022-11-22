extends "res://Resources/ActionButton.gd"

const Spell = preload("res://Resources/Images/Animations/Spell.tscn")

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	if enemy != null and playerStats != null:
		if playerStats.mp >=6:
			create_spell(enemy.global_position)
			enemy.take_damage(6)
			playerStats.mp -= 4
			playerStats.ap -= 1
		
func create_spell(position):
	var spell = Spell.instance()
	var main = get_tree().current_scene
	main.add_child(spell)
	spell.global_position = position
