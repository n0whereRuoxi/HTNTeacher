( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b20 - block
    b389 - block
    b524 - block
    b881 - block
    b147 - block
    b325 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b20 )
    ( on b389 b20 )
    ( on b524 b389 )
    ( on b881 b524 )
    ( on b147 b881 )
    ( on b325 b147 )
    ( clear b325 )
  )
  ( :goal
    ( and
      ( clear b20 )
    )
  )
)
