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
  ( :task Make-3Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
      ?b3 - block
    )
    :precondition
    (
    )
    :effect
    ( and
      ( on-table ?b1 )
      ( on ?b2 ?b1 )
      ( on ?b3 ?b2 )
      ( clear ?b3 )
    )
  )
  ( :task Make-4Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
      ?b3 - block
      ?b4 - block
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
      ( clear ?b4 )
    )
  )
  ( :task Make-5Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
      ?b3 - block
      ?b4 - block
      ?b5 - block
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
      ( clear ?b5 )
    )
  )
  ( :task Make-6Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
      ?b3 - block
      ?b4 - block
      ?b5 - block
      ?b6 - block
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
      ( clear ?b6 )
    )
  )
  ( :task Make-7Pile
    :parameters
    (
      ?b1 - block
      ?b2 - block
      ?b3 - block
      ?b4 - block
      ?b5 - block
      ?b6 - block
      ?b7 - block
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
      ( clear ?b7 )
    )
  )
  ( :task Make-8Pile
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
      ( clear ?b8 )
    )
  )
  ( :task Make-9Pile
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
      ( clear ?b9 )
    )
  )
)