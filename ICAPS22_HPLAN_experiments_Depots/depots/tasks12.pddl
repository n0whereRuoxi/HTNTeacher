( define
  ( tasks depots-tasks )
  ( :task Make-On
    :parameters
    (
      ?c1 - surface
      ?c2 - surface
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on ?c1 ?c2 )
    )
  )
)
