extends Sprite

onready var targetIcon = get_node("/root/Node2D/icon")
onready var tween = get_node("/root/Node2D/icon2/Tween")

enum METHOD_TYPE { FOLLOW_METHOD, FOLLOW_PROPERTY, INTERPOLATE_METHOD, INTERPOLATE_PROPERTY }

# Change this value to test out the 4 Tween methods
var activateMethod = METHOD_TYPE.FOLLOW_PROPERTY 

func _ready() -> void:
	print("Nodes: ")
	print(targetIcon)
	print(tween, "\n")
	var tweenBool
	match activateMethod:
		METHOD_TYPE.FOLLOW_METHOD:
			tweenBool = tween.follow_method(self,"printFollowMethod", 0, targetIcon, "MovingTargetPosition", 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		METHOD_TYPE.FOLLOW_PROPERTY:
			tweenBool = tween.follow_property(self,"position", get_position(), targetIcon, "position", 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		METHOD_TYPE.INTERPOLATE_METHOD:
			tweenBool = tween.interpolate_method( self, "setHealth", 0.0, 100.0, 10.0,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		METHOD_TYPE.INTERPOLATE_PROPERTY:
			tweenBool = tween.interpolate_property(self,"position", get_position(), targetIcon.position, 1.0,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	print(tweenBool)

func printFollowMethod(valuePassedIn):
	print(valuePassedIn)

func setHealth(valuePassedIn):
	print(valuePassedIn)
