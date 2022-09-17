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
  ( :task Make-20Pile
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
      ?b20 - block
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
      ( on ?b20 ?b19 )
      ( clear ?b20 )
    )
  )
  ( :task Make-21Pile
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
      ?b20 - block
      ?b21 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( clear ?b21 )
    )
  )
  ( :task Make-22Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( clear ?b22 )
    )
  )
  ( :task Make-23Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( clear ?b23 )
    )
  )
  ( :task Make-24Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( clear ?b24 )
    )
  )
  ( :task Make-25Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( clear ?b25 )
    )
  )
  ( :task Make-26Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( clear ?b26 )
    )
  )
  ( :task Make-27Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( clear ?b27 )
    )
  )
  ( :task Make-28Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( clear ?b28 )
    )
  )
  ( :task Make-29Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( clear ?b29 )
    )
  )
  ( :task Make-30Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( clear ?b30 )
    )
  )
  ( :task Make-31Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
      ?b31 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( on ?b31 ?b30 )
      ( clear ?b31 )
    )
  )
  ( :task Make-32Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
      ?b31 - block
      ?b32 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( on ?b31 ?b30 )
      ( on ?b32 ?b31 )
      ( clear ?b32 )
    )
  )
  ( :task Make-33Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
      ?b31 - block
      ?b32 - block
      ?b33 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( on ?b31 ?b30 )
      ( on ?b32 ?b31 )
      ( on ?b33 ?b32 )
      ( clear ?b33 )
    )
  )
  ( :task Make-34Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
      ?b31 - block
      ?b32 - block
      ?b33 - block
      ?b34 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( on ?b31 ?b30 )
      ( on ?b32 ?b31 )
      ( on ?b33 ?b32 )
      ( on ?b34 ?b33 )
      ( clear ?b34 )
    )
  )
  ( :task Make-35Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
      ?b31 - block
      ?b32 - block
      ?b33 - block
      ?b34 - block
      ?b35 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( on ?b31 ?b30 )
      ( on ?b32 ?b31 )
      ( on ?b33 ?b32 )
      ( on ?b34 ?b33 )
      ( on ?b35 ?b34 )
      ( clear ?b35 )
    )
  )
  ( :task Make-36Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
      ?b31 - block
      ?b32 - block
      ?b33 - block
      ?b34 - block
      ?b35 - block
      ?b36 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( on ?b31 ?b30 )
      ( on ?b32 ?b31 )
      ( on ?b33 ?b32 )
      ( on ?b34 ?b33 )
      ( on ?b35 ?b34 )
      ( on ?b36 ?b35 )
      ( clear ?b36 )
    )
  )
  ( :task Make-37Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
      ?b31 - block
      ?b32 - block
      ?b33 - block
      ?b34 - block
      ?b35 - block
      ?b36 - block
      ?b37 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( on ?b31 ?b30 )
      ( on ?b32 ?b31 )
      ( on ?b33 ?b32 )
      ( on ?b34 ?b33 )
      ( on ?b35 ?b34 )
      ( on ?b36 ?b35 )
      ( on ?b37 ?b36 )
      ( clear ?b37 )
    )
  )
  ( :task Make-38Pile
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
      ?b20 - block
      ?b21 - block
      ?b22 - block
      ?b23 - block
      ?b24 - block
      ?b25 - block
      ?b26 - block
      ?b27 - block
      ?b28 - block
      ?b29 - block
      ?b30 - block
      ?b31 - block
      ?b32 - block
      ?b33 - block
      ?b34 - block
      ?b35 - block
      ?b36 - block
      ?b37 - block
      ?b38 - block
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
      ( on ?b20 ?b19 )
      ( on ?b21 ?b20 )
      ( on ?b22 ?b21 )
      ( on ?b23 ?b22 )
      ( on ?b24 ?b23 )
      ( on ?b25 ?b24 )
      ( on ?b26 ?b25 )
      ( on ?b27 ?b26 )
      ( on ?b28 ?b27 )
      ( on ?b29 ?b28 )
      ( on ?b30 ?b29 )
      ( on ?b31 ?b30 )
      ( on ?b32 ?b31 )
      ( on ?b33 ?b32 )
      ( on ?b34 ?b33 )
      ( on ?b35 ?b34 )
      ( on ?b36 ?b35 )
      ( on ?b37 ?b36 )
      ( on ?b38 ?b37 )
      ( clear ?b38 )
    )
  )
)
