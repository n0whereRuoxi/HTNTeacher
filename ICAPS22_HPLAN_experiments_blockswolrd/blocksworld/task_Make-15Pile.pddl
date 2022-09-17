( define
  ( tasks Blocks4-tasks )
  ( :task Make-15Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
      ?b3 - block
      ?b4 - block
      ?b5 - block
      ?b6 - block
      ?b7 - block
      ?b8 - block
      ?b9 - block
      ?b10 - block
      ?b11 - block
      ?b12 - block
      ?b13 - block
      ?b14 - block
      ?b15 - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on-table ?b1 )
      ( on ?b2 ?b1 )
      ( on ?b3 ?b2 )
      ( on ?b4 ?b3 )
      ( on ?b5 ?b4 )
      ( on ?b6 ?b5 )
      ( on ?b7 ?b6 )
      ( on ?b8 ?b7 )
      ( on ?b9 ?b8 )
      ( on ?b10 ?b9 )
      ( on ?b11 ?b10 )
      ( on ?b12 ?b11 )
      ( on ?b13 ?b12 )
      ( on ?b14 ?b13 )
      ( on ?b15 ?b14 )
      ( clear ?b15 )
    )
  )
)
