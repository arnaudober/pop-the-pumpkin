extends Node2D

@export var throw_force : float = 500  # Force applied when thrown
@export var speed : float = 300  # Speed of the thrown object

var velocity : Vector2 = Vector2.ZERO  # Current velocity of the object

func throw_object():
	var random_angle = randf_range(0, 2 * PI)
	var direction = Vector2(cos(random_angle), sin(random_angle))
	
	velocity = direction.normalized() * speed  # Set velocity based on direction and speed
	
# Detect mouse clicks on the object
func _input():
	# Check if the user clicked the left mouse button
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Check if the mouse position is within the bounds of the object's sprite
		if get_global_mouse_position().distance_to(position) < 66:
			# The object is clicked, so make it disappear
			queue_free()  # Remove the object from the scene

func _process(delta):
	# Update the object's position based on its velocity
	position += velocity * delta  # Move the object by its velocity

	velocity.y += 1000 * delta  # Gravity

	if position.y > 600:  # If it falls below the screen, we stop the object
		velocity = Vector2.ZERO
