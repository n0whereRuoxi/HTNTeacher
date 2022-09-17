( define
  ( tasks depots-tasks )
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
)
