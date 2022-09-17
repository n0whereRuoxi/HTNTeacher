( define
  ( tasks logistics-tasks )
  ( :task Deliver-4Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?obj3 - obj
      ?obj4 - obj
      ?dst - location
    )
    :precondition
    ( and
      ( greater-than ?obj2 ?obj1 )
      ( greater-than ?obj3 ?obj1 )
      ( greater-than ?obj3 ?obj2 )
      ( greater-than ?obj4 ?obj1 )
      ( greater-than ?obj4 ?obj2 )
      ( greater-than ?obj4 ?obj3 )
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
      ( obj-at ?obj2 ?dst )
      ( obj-at ?obj3 ?dst )
      ( obj-at ?obj4 ?dst )
    )
  )
)
