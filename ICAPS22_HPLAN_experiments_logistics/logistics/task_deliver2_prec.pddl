( define
  ( tasks logistics-tasks )
  ( :task Deliver-2Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?dst - location
    )
    :precondition
    ( and
      ( greater-than ?obj2 ?obj1 )
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
      ( obj-at ?obj2 ?dst )
    )
  )
)
