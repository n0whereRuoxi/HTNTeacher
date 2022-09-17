( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b198 - block
    b356 - block
    b945 - block
    b897 - block
    b997 - block
    b832 - block
    b70 - block
    b800 - block
    b511 - block
    b785 - block
    b108 - block
    b549 - block
    b626 - block
    b448 - block
    b797 - block
    b298 - block
    b122 - block
    b747 - block
    b899 - block
    b986 - block
    b643 - block
    b398 - block
    b130 - block
    b222 - block
    b453 - block
    b152 - block
    b220 - block
    b311 - block
    b240 - block
    b179 - block
    b486 - block
    b501 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b198 )
    ( on b356 b198 )
    ( on b945 b356 )
    ( on b897 b945 )
    ( on b997 b897 )
    ( on b832 b997 )
    ( on b70 b832 )
    ( on b800 b70 )
    ( on b511 b800 )
    ( on b785 b511 )
    ( on b108 b785 )
    ( on b549 b108 )
    ( on b626 b549 )
    ( on b448 b626 )
    ( on b797 b448 )
    ( on b298 b797 )
    ( on b122 b298 )
    ( on b747 b122 )
    ( on b899 b747 )
    ( on b986 b899 )
    ( on b643 b986 )
    ( on b398 b643 )
    ( on b130 b398 )
    ( on b222 b130 )
    ( on b453 b222 )
    ( on b152 b453 )
    ( on b220 b152 )
    ( on b311 b220 )
    ( on b240 b311 )
    ( on b179 b240 )
    ( on b486 b179 )
    ( on b501 b486 )
    ( clear b501 )
  )
  ( :goal
    ( and
      ( clear b198 )
    )
  )
)
