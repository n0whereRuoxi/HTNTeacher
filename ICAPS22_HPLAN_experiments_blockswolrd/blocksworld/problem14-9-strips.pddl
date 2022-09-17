( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b721 - block
    b555 - block
    b948 - block
    b107 - block
    b580 - block
    b190 - block
    b481 - block
    b650 - block
    b389 - block
    b465 - block
    b950 - block
    b505 - block
    b37 - block
    b121 - block
    b932 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b721 )
    ( on b555 b721 )
    ( on b948 b555 )
    ( on b107 b948 )
    ( on b580 b107 )
    ( on b190 b580 )
    ( on b481 b190 )
    ( on b650 b481 )
    ( on b389 b650 )
    ( on b465 b389 )
    ( on b950 b465 )
    ( on b505 b950 )
    ( on b37 b505 )
    ( on b121 b37 )
    ( on b932 b121 )
    ( clear b932 )
  )
  ( :goal
    ( and
      ( clear b721 )
    )
  )
)
