extends Sprite

const SPEED = 100

func _physics_process(delta: float) -> void:
	position.x += SPEED * delta


func testMethod():
	return 1

func MovingTargetPosition():
	return position.x
	
