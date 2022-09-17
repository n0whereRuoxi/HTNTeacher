( define
  ( tasks logistics-tasks )
  ( :task Deliver-1Pkg
    :parameters
    (
      ?obj1 - obj
      ?dst - location
    )
    :precondition
    ( and
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
    )
  )
  ( :task Deliver-2Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?dst - location
    )
    :precondition
    ( and
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
      ( obj-at ?obj2 ?dst )
    )
  )
)
