extends Node2D

@export var gem_scene : PackedScene  # Export the PackedScene for the gem (Object.tscn)
var pumpkin : Sprite2D  # Reference to the pumpkin sprite

@onready var anim_player = $AnimationPlayer

func _ready():
    pumpkin = $PumpkinSprite
    anim_player.play("rotate")

func	 _input(event):
     if event.is_action_pressed("throw"):  # Assuming "throw" is a custom input action (e.g., mouse click)
        throw_gem()

func throw_gem():
    # Instantiate the gem object
    var gem_instance = gem_scene.instantiate()  # Create a new gem instance from the scene
    add_child(gem_instance)  # Add the gem to the scene tree

    # Position the gem at the pumpkin's location (or where you want to start the throw)
    gem_instance.position = pumpkin.position

    # Call the throw_object method to apply force/direction
    gem_instance.throw_object()
