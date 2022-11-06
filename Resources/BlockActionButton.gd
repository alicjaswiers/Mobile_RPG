extends "res://Resources/ActionButton.gd"

func _on_pressed():
	var playerStats = BattleUnits.PlayerStats
	if playerStats != null:
		if playerStats.mp >= 1:
			if playerStats.ap == 3:
				playerStats.ap -= 3
				playerStats.mp += 8
