( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b289 - block
    b954 - block
    b46 - block
    b939 - block
    b904 - block
    b787 - block
    b150 - block
    b144 - block
    b736 - block
    b957 - block
    b81 - block
    b147 - block
    b186 - block
    b761 - block
    b879 - block
    b56 - block
    b2 - block
    b655 - block
    b446 - block
    b672 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b289 )
    ( on b954 b289 )
    ( on b46 b954 )
    ( on b939 b46 )
    ( on b904 b939 )
    ( on b787 b904 )
    ( on b150 b787 )
    ( on b144 b150 )
    ( on b736 b144 )
    ( on b957 b736 )
    ( on b81 b957 )
    ( on b147 b81 )
    ( on b186 b147 )
    ( on b761 b186 )
    ( on b879 b761 )
    ( on b56 b879 )
    ( on b2 b56 )
    ( on b655 b2 )
    ( on b446 b655 )
    ( on b672 b446 )
    ( clear b672 )
  )
  ( :goal
    ( and
      ( clear b289 )
    )
  )
)
