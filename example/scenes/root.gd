extends Node2D

@onready var encounter = $EncounterPlayer
@onready var description = $Description
@onready var optionsContainer = $Options

# Called when the node enters the scene tree for the first time.
func _ready():
   encounter.new_event.connect(handle_event)
   encounter.completed.connect(hide_encounter)
   encounter.start()

func handle_event(desc: String, options: Array):
   description.text = desc

   clear_options()
   for option in options:
      var new_button = Button.new()

      new_button.text = option
      new_button.pressed.connect(func(): encounter.next(option))

      optionsContainer.add_child(new_button)

func hide_encounter():
   print("Encounter finish")
   pass

func clear_options():
   for child in optionsContainer.get_children():
      optionsContainer.remove_child(child)
      child.queue_free()
