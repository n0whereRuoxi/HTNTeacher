( define
  ( tasks zenotravel-tasks )
  ( :task Fly-5Ppl
    :parameters
    (
      ?p1 - person
      ?p2 - person
      ?p3 - person
      ?p4 - person
      ?p5 - person
      ?c - city
    )
    :precondition
    (
    )
    :effect
    ( and
      ( person-at ?p1 ?c )
      ( person-at ?p2 ?c )
      ( person-at ?p3 ?c )
      ( person-at ?p4 ?c )
      ( person-at ?p5 ?c )
    )
  )
)
