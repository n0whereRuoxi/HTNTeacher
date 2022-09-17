( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b261 - block
    b159 - block
    b470 - block
    b836 - block
    b450 - block
    b258 - block
    b565 - block
    b763 - block
    b45 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b261 )
    ( on b159 b261 )
    ( on b470 b159 )
    ( on b836 b470 )
    ( on b450 b836 )
    ( on b258 b450 )
    ( on b565 b258 )
    ( on b763 b565 )
    ( on b45 b763 )
    ( clear b45 )
  )
  ( :goal
    ( and
      ( clear b261 )
    )
  )
)
