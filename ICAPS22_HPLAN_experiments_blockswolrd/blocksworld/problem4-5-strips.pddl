( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b737 - block
    b559 - block
    b563 - block
    b384 - block
    b792 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b737 )
    ( on b559 b737 )
    ( on b563 b559 )
    ( on b384 b563 )
    ( on b792 b384 )
    ( clear b792 )
  )
  ( :goal
    ( and
      ( clear b737 )
    )
  )
)
