( define
  ( tasks zenotravel-tasks )
  ( :task Fly-9Ppl
    :parameters
    (
      ?p1 - person
      ?p2 - person
      ?p3 - person
      ?p4 - person
      ?p5 - person
      ?p6 - person
      ?p7 - person
      ?p8 - person
      ?p9 - person
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
      ( person-at ?p6 ?c )
      ( person-at ?p7 ?c )
      ( person-at ?p8 ?c )
      ( person-at ?p9 ?c )
    )
  )
)
