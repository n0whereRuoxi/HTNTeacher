( define
  ( tasks logistics-tasks )
  ( :task Deliver-12Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?obj3 - obj
      ?obj4 - obj
      ?obj5 - obj
      ?obj6 - obj
      ?obj7 - obj
      ?obj8 - obj
      ?obj9 - obj
      ?obj10 - obj
      ?obj11 - obj
      ?obj12 - obj
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
      ( obj-at ?obj6 ?dst )
      ( obj-at ?obj7 ?dst )
      ( obj-at ?obj8 ?dst )
      ( obj-at ?obj9 ?dst )
      ( obj-at ?obj10 ?dst )
      ( obj-at ?obj11 ?dst )
      ( obj-at ?obj12 ?dst )
    )
  )
)
