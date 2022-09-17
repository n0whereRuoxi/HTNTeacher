( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b734 - block
    b493 - block
    b1 - block
    b789 - block
    b540 - block
    b25 - block
    b420 - block
    b943 - block
    b904 - block
    b921 - block
    b112 - block
    b743 - block
    b626 - block
    b551 - block
    b398 - block
    b314 - block
    b238 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b734 )
    ( on b493 b734 )
    ( on b1 b493 )
    ( on b789 b1 )
    ( on b540 b789 )
    ( on b25 b540 )
    ( on b420 b25 )
    ( on b943 b420 )
    ( on b904 b943 )
    ( on b921 b904 )
    ( on b112 b921 )
    ( on b743 b112 )
    ( on b626 b743 )
    ( on b551 b626 )
    ( on b398 b551 )
    ( on b314 b398 )
    ( on b238 b314 )
    ( clear b238 )
  )
  ( :goal
    ( and
      ( clear b734 )
    )
  )
)
