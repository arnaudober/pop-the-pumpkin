extends Node2D

@export var throw_force : float = 500  # Force applied when thrown
@export var speed : float = 300  # Speed of the thrown object

var velocity : Vector2 = Vector2.ZERO  # Current velocity of the gem

func _ready():
	# Optional: Set up the initial state of the gem
	pass

func throw_object():
	var random_angle = randf_range(0, 2 * PI)
	var direction = Vector2(cos(random_angle), sin(random_angle))
	
	# This function is called to apply the throw force to the gem
	velocity = direction.normalized() * speed  # Set velocity based on direction and speed
	
# Detect mouse clicks on the gem
func _input():
	# Check if the user clicked the left mouse button
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Check if the mouse position is within the bounds of the gem's sprite
		if get_global_mouse_position().distance_to(position) < 66:  # Example distance, adjust to your gem size
			# The object is clicked, so make it disappear
			queue_free()  # Remove the gem from the scene

func _process(delta):
	# Update the gem's position based on its velocity
	position += velocity * delta  # Move the gem by its velocity

	# Optional: Add gravity or apply friction if needed
	velocity.y += 1000 * delta  # Gravity (you can adjust this for a more realistic effect)

	# Optional: Stop the gem after it hits the ground or reaches a certain condition
	if position.y > 600:  # Example condition: if it falls below the screen
		velocity = Vector2.ZERO  # Stop the gem
