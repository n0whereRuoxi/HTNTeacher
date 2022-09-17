( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b36 - block
    b12 - block
    b137 - block
    b78 - block
    b976 - block
    b615 - block
    b193 - block
    b351 - block
    b170 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b36 )
    ( on b12 b36 )
    ( on b137 b12 )
    ( on b78 b137 )
    ( on b976 b78 )
    ( on b615 b976 )
    ( on b193 b615 )
    ( on b351 b193 )
    ( on b170 b351 )
    ( clear b170 )
  )
  ( :goal
    ( and
      ( clear b36 )
    )
  )
)
