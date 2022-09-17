( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b571 - block
    b94 - block
    b39 - block
    b522 - block
    b311 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b571 )
    ( on b94 b571 )
    ( on b39 b94 )
    ( on b522 b39 )
    ( on b311 b522 )
    ( clear b311 )
  )
  ( :goal
    ( and
      ( clear b571 )
    )
  )
)
