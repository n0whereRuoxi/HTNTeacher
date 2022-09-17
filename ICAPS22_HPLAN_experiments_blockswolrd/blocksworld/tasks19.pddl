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
  ( :task Make-10Pile
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
      ( clear ?b10 )
    )
  )
  ( :task Make-11Pile
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
      ( clear ?b11 )
    )
  )
  ( :task Make-12Pile
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
      ( clear ?b12 )
    )
  )
  ( :task Make-13Pile
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
      ( clear ?b13 )
    )
  )
  ( :task Make-14Pile
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
      ( clear ?b14 )
    )
  )
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
  ( :task Make-16Pile
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
      ?b16 - block
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
      ( on ?b16 ?b15 )
      ( clear ?b16 )
    )
  )
  ( :task Make-17Pile
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
      ?b16 - block
      ?b17 - block
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
      ( on ?b16 ?b15 )
      ( on ?b17 ?b16 )
      ( clear ?b17 )
    )
  )
  ( :task Make-18Pile
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
      ?b16 - block
      ?b17 - block
      ?b18 - block
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
      ( on ?b16 ?b15 )
      ( on ?b17 ?b16 )
      ( on ?b18 ?b17 )
      ( clear ?b18 )
    )
  )
  ( :task Make-19Pile
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
      ?b16 - block
      ?b17 - block
      ?b18 - block
      ?b19 - block
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
      ( on ?b16 ?b15 )
      ( on ?b17 ?b16 )
      ( on ?b18 ?b17 )
      ( on ?b19 ?b18 )
      ( clear ?b19 )
    )
  )
)
