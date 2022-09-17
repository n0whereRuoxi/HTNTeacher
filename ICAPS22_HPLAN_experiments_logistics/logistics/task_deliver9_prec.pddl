( define
  ( tasks logistics-tasks )
  ( :task Deliver-9Pkg
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
      ( greater-than ?obj5 ?obj1 )
      ( greater-than ?obj5 ?obj2 )
      ( greater-than ?obj5 ?obj3 )
      ( greater-than ?obj5 ?obj4 )
      ( greater-than ?obj6 ?obj1 )
      ( greater-than ?obj6 ?obj2 )
      ( greater-than ?obj6 ?obj3 )
      ( greater-than ?obj6 ?obj4 )
      ( greater-than ?obj6 ?obj5 )
      ( greater-than ?obj7 ?obj1 )
      ( greater-than ?obj7 ?obj2 )
      ( greater-than ?obj7 ?obj3 )
      ( greater-than ?obj7 ?obj4 )
      ( greater-than ?obj7 ?obj5 )
      ( greater-than ?obj7 ?obj6 )
      ( greater-than ?obj8 ?obj1 )
      ( greater-than ?obj8 ?obj2 )
      ( greater-than ?obj8 ?obj3 )
      ( greater-than ?obj8 ?obj4 )
      ( greater-than ?obj8 ?obj5 )
      ( greater-than ?obj8 ?obj6 )
      ( greater-than ?obj8 ?obj7 )
      ( greater-than ?obj9 ?obj1 )
      ( greater-than ?obj9 ?obj2 )
      ( greater-than ?obj9 ?obj3 )
      ( greater-than ?obj9 ?obj4 )
      ( greater-than ?obj9 ?obj5 )
      ( greater-than ?obj9 ?obj6 )
      ( greater-than ?obj9 ?obj7 )
      ( greater-than ?obj9 ?obj8 )
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
    )
  )
)
