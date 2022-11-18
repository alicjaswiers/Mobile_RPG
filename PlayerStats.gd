extends Node

const BattleUnits = preload("res://BattleUnits.tres")

var max_hp = 25
var hp = max_hp setget set_hp
var max_ap = 3
var ap = max_ap setget set_ap
var max_mp = 10
var mp = max_mp setget set_mp
var max_points = 100
var points = 0 setget set_points
var max_stage = 100
var stage = 0 setget set_stage

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)
signal points_changed(value)
signal stage_changed(value)
signal end_turn

func set_hp(value):
	hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed", hp)

func set_ap(value):
	ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")

func set_mp(value):
	mp = clamp(value, 0, max_mp)
	emit_signal("mp_changed", mp)

func set_points(value):
	points = clamp(value, 0, max_points)
	emit_signal("points_changed", points)
	if BattleUnits.Enemy == null:
		points += 3
	
func set_stage(value):
	stage = clamp(value, 0, max_stage)
	emit_signal("stage_changed", stage)
	if BattleUnits.Enemy == null:
		stage += 1

func _ready():
	BattleUnits.PlayerStats = self

func _exit_tree():
	BattleUnits.PlayerStats = null
