( define
  ( tasks Blocks4-tasks )
  ( :task Make-1Pile
    :parameters
    (
      ?b1 - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on-table ?b1 )
      ( clear ?b1 )
    )
  )
)
