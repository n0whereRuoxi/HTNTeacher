( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b389 - block
    b298 - block
    b90 - block
    b181 - block
    b352 - block
    b377 - block
    b224 - block
    b197 - block
    b696 - block
    b731 - block
    b317 - block
    b238 - block
    b299 - block
    b488 - block
    b42 - block
    b54 - block
    b939 - block
    b253 - block
    b311 - block
    b922 - block
    b76 - block
    b484 - block
    b472 - block
    b256 - block
    b957 - block
    b122 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b389 )
    ( on b298 b389 )
    ( on b90 b298 )
    ( on b181 b90 )
    ( on b352 b181 )
    ( on b377 b352 )
    ( on b224 b377 )
    ( on b197 b224 )
    ( on b696 b197 )
    ( on b731 b696 )
    ( on b317 b731 )
    ( on b238 b317 )
    ( on b299 b238 )
    ( on b488 b299 )
    ( on b42 b488 )
    ( on b54 b42 )
    ( on b939 b54 )
    ( on b253 b939 )
    ( on b311 b253 )
    ( on b922 b311 )
    ( on b76 b922 )
    ( on b484 b76 )
    ( on b472 b484 )
    ( on b256 b472 )
    ( on b957 b256 )
    ( on b122 b957 )
    ( clear b122 )
  )
  ( :goal
    ( and
      ( clear b389 )
    )
  )
)
