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
  ( :task Fly-2Ppl
    :parameters
    (
      ?p1 - person
      ?p2 - person
      ?c - city
    )
    :precondition
    (
    )
    :effect
    ( and
      ( person-at ?p1 ?c )
      ( person-at ?p2 ?c )
    )
  )
  ( :task Fly-3Ppl
    :parameters
    (
      ?p1 - person
      ?p2 - person
      ?p3 - person
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
    )
  )
  ( :task Fly-4Ppl
    :parameters
    (
      ?p1 - person
      ?p2 - person
      ?p3 - person
      ?p4 - person
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
    )
  )
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
  ( :task Fly-6Ppl
    :parameters
    (
      ?p1 - person
      ?p2 - person
      ?p3 - person
      ?p4 - person
      ?p5 - person
      ?p6 - person
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
    )
  )
  ( :task Fly-7Ppl
    :parameters
    (
      ?p1 - person
      ?p2 - person
      ?p3 - person
      ?p4 - person
      ?p5 - person
      ?p6 - person
      ?p7 - person
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
    )
  )
)
