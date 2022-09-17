( define
  ( tasks zeno-travel-tasks )

  ( :task Travel
    :parameters
    ( ?p - person
      ?c - city )
    :precondition
    ()
    :effect
    ( and
      ( person-at ?p ?c ) )
  )

)
