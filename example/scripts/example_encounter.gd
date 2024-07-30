extends Encounter

@export var encounter: EncounterPlayer

func get_encounter():
   var example_option_b = event(
      "I don't know, you wanna go back or something",
      {
         "Test Action": action(some_encounter_action, true),
         "Test Back": event(
            "Testing Back Button",
               {
               "Back": action(encounter.previous)
               }
         ),
         "Test Reset": event(
            "Testing Reset Here",
               {
               "Reset": action(encounter.reset)
               }
         )
      },
   )
   return event(
      "Some description",
      {
         "Option A": event("Some other dialog or something like that", {}, on_event),
         "Option B": example_option_b
      },
   )

func on_event():
   print("I AM EVENT")
   pass
func some_encounter_action():
   print("Some function")
   pass
