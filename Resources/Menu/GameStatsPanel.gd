extends Panel

const BattleUnits = preload("res://BattleUnits.tres")

onready var stageLabel = $GameStats/StageLabel
onready var pointsLabel = $GameStats/PointsLabel

func _on_PlayerStats_points_changed(value):
	$GameStats/PointsLabelPointsLabel.text = "POINTS: "+str(value)
	
func _on_PlayerStats_stage_changed(value):
	$GameStats/StageLabelStageLabel.text = "STAGE: "+str(value)
