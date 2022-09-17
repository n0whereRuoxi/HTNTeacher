( define
  ( tasks logistics-tasks )
  ( :task Deliver-5Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?obj3 - obj
      ?obj4 - obj
      ?obj5 - obj
      ?dst - location
    )
    :precondition
    ( and
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
      ( obj-at ?obj2 ?dst )
      ( obj-at ?obj3 ?dst )
      ( obj-at ?obj4 ?dst )
      ( obj-at ?obj5 ?dst )
    )
  )
)
