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
  ( :task Make-2Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on-table ?b1 )
      ( on ?b2 ?b1 )
      ( clear ?b2 )
    )
  )
)
