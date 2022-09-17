( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b202 - block
    b455 - block
    b551 - block
    b152 - block
    b444 - block
    b303 - block
    b24 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b202 )
    ( on b455 b202 )
    ( on b551 b455 )
    ( on b152 b551 )
    ( on b444 b152 )
    ( on b303 b444 )
    ( on b24 b303 )
    ( clear b24 )
  )
  ( :goal
    ( and
      ( clear b202 )
    )
  )
)
