( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b615 - block
    b459 - block
    b526 - block
    b25 - block
    b970 - block
    b179 - block
    b228 - block
    b251 - block
    b100 - block
    b368 - block
    b79 - block
    b862 - block
    b63 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b615 )
    ( on b459 b615 )
    ( on b526 b459 )
    ( on b25 b526 )
    ( on b970 b25 )
    ( on b179 b970 )
    ( on b228 b179 )
    ( on b251 b228 )
    ( on b100 b251 )
    ( on b368 b100 )
    ( on b79 b368 )
    ( on b862 b79 )
    ( on b63 b862 )
    ( on b15 b63 )
    ( clear b15 )
  )
  ( :goal
    ( and
      ( clear b615 )
    )
  )
)
