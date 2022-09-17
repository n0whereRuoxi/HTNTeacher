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
  ( :task Deliver-3Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?obj3 - obj
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
    )
  )
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
    )
    :effect
    ( and
      ( obj-at ?obj1 ?dst )
      ( obj-at ?obj2 ?dst )
      ( obj-at ?obj3 ?dst )
      ( obj-at ?obj4 ?dst )
    )
  )
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
  ( :task Deliver-6Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?obj3 - obj
      ?obj4 - obj
      ?obj5 - obj
      ?obj6 - obj
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
    )
  )
  ( :task Deliver-7Pkg
    :parameters
    (
      ?obj1 - obj
      ?obj2 - obj
      ?obj3 - obj
      ?obj4 - obj
      ?obj5 - obj
      ?obj6 - obj
      ?obj7 - obj
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
    )
  )
  ( :task Deliver-8Pkg
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
    )
  )
)
