( define
  ( tasks depots-tasks )
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
)
