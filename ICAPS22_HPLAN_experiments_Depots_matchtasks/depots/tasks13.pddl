( define
  ( tasks depots-tasks )
  ( :task Make-1Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( clear ?c1 )
    )
  )
  ( :task Make-2Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( clear ?c2 )
    )
  )
  ( :task Make-3Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( clear ?c3 )
    )
  )
  ( :task Make-4Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( clear ?c4 )
    )
  )
  ( :task Make-5Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( clear ?c5 )
    )
  )
  ( :task Make-6Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
      ?c6 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( on ?c6 ?c5 )
      ( clear ?c6 )
    )
  )
  ( :task Make-7Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
      ?c6 - surface
      ?c7 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( on ?c6 ?c5 )
      ( on ?c7 ?c6 )
      ( clear ?c7 )
    )
  )
  ( :task Make-8Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
      ?c6 - surface
      ?c7 - surface
      ?c8 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( on ?c6 ?c5 )
      ( on ?c7 ?c6 )
      ( on ?c8 ?c7 )
      ( clear ?c8 )
    )
  )
  ( :task Make-9Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
      ?c6 - surface
      ?c7 - surface
      ?c8 - surface
      ?c9 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( on ?c6 ?c5 )
      ( on ?c7 ?c6 )
      ( on ?c8 ?c7 )
      ( on ?c9 ?c8 )
      ( clear ?c9 )
    )
  )
  ( :task Make-10Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
      ?c6 - surface
      ?c7 - surface
      ?c8 - surface
      ?c9 - surface
      ?c10 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( on ?c6 ?c5 )
      ( on ?c7 ?c6 )
      ( on ?c8 ?c7 )
      ( on ?c9 ?c8 )
      ( on ?c10 ?c9 )
      ( clear ?c10 )
    )
  )
  ( :task Make-11Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
      ?c6 - surface
      ?c7 - surface
      ?c8 - surface
      ?c9 - surface
      ?c10 - surface
      ?c11 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( on ?c6 ?c5 )
      ( on ?c7 ?c6 )
      ( on ?c8 ?c7 )
      ( on ?c9 ?c8 )
      ( on ?c10 ?c9 )
      ( on ?c11 ?c10 )
      ( clear ?c11 )
    )
  )
  ( :task Make-12Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
      ?c6 - surface
      ?c7 - surface
      ?c8 - surface
      ?c9 - surface
      ?c10 - surface
      ?c11 - surface
      ?c12 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( on ?c6 ?c5 )
      ( on ?c7 ?c6 )
      ( on ?c8 ?c7 )
      ( on ?c9 ?c8 )
      ( on ?c10 ?c9 )
      ( on ?c11 ?c10 )
      ( on ?c12 ?c11 )
      ( clear ?c12 )
    )
  )
  ( :task Make-13Crate
    :parameters
    (
      ?p0 - surface
      ?c1 - surface
      ?c2 - surface
      ?c3 - surface
      ?c4 - surface
      ?c5 - surface
      ?c6 - surface
      ?c7 - surface
      ?c8 - surface
      ?c9 - surface
      ?c10 - surface
      ?c11 - surface
      ?c12 - surface
      ?c13 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?p0 )
      ( on ?c2 ?c1 )
      ( on ?c3 ?c2 )
      ( on ?c4 ?c3 )
      ( on ?c5 ?c4 )
      ( on ?c6 ?c5 )
      ( on ?c7 ?c6 )
      ( on ?c8 ?c7 )
      ( on ?c9 ?c8 )
      ( on ?c10 ?c9 )
      ( on ?c11 ?c10 )
      ( on ?c12 ?c11 )
      ( on ?c13 ?c12 )
      ( clear ?c13 )
    )
  )
)
