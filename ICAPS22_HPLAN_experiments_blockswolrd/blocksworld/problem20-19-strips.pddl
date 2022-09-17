( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b338 - block
    b927 - block
    b324 - block
    b971 - block
    b925 - block
    b155 - block
    b495 - block
    b516 - block
    b40 - block
    b389 - block
    b904 - block
    b312 - block
    b519 - block
    b169 - block
    b252 - block
    b798 - block
    b648 - block
    b777 - block
    b731 - block
    b997 - block
    b844 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b338 )
    ( on b927 b338 )
    ( on b324 b927 )
    ( on b971 b324 )
    ( on b925 b971 )
    ( on b155 b925 )
    ( on b495 b155 )
    ( on b516 b495 )
    ( on b40 b516 )
    ( on b389 b40 )
    ( on b904 b389 )
    ( on b312 b904 )
    ( on b519 b312 )
    ( on b169 b519 )
    ( on b252 b169 )
    ( on b798 b252 )
    ( on b648 b798 )
    ( on b777 b648 )
    ( on b731 b777 )
    ( on b997 b731 )
    ( on b844 b997 )
    ( clear b844 )
  )
  ( :goal
    ( and
      ( clear b338 )
    )
  )
)
