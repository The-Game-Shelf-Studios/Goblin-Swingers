extends Node3D

var GobbosRemaining = 0
var CheckForLevelCompleted: bool = false
var PlayerDied: bool = false
var PlayerObject
var GameEnded: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerObject = get_tree().get_first_node_in_group("Player")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	UpdatePlayerEnemyCountLabel()
	if CheckForLevelCompleted:
		if GobbosRemaining <= 0:
			PlayerVictory()
		else:
			if PlayerDied:
				PlayerDefeat()
	pass


func PlayerVictory() -> void:
	PlayerObject.WinGame()
	if !GameEnded:
		print("Game Won!")
		GameEnded = true
	

func UpdatePlayerEnemyCountLabel() -> void:
	PlayerObject.SetRemainingEnemiesCounter(GobbosRemaining)
	pass

func PlayerDefeat() -> void:
	if !GameEnded:
		print("Game Lost")
		GameEnded = true
	

func _on_timer_timeout() -> void:
	CheckForLevelCompleted = true
	pass # Replace with function body.
