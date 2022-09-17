( define
  ( tasks zenotravel-tasks )
  ( :task Fly-1Ppl
    :parameters
    (
      ?p1 - person
      ?c - city
    )
    :precondition
    (
    )
    :effect
    ( and
      ( person-at ?p1 ?c )
    )
  )
)
