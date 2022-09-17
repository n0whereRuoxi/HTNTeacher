( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b732 - block
    b788 - block
    b290 - block
    b375 - block
    b482 - block
    b269 - block
    b977 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b732 )
    ( on b788 b732 )
    ( on b290 b788 )
    ( on b375 b290 )
    ( on b482 b375 )
    ( on b269 b482 )
    ( on b977 b269 )
    ( clear b977 )
  )
  ( :goal
    ( and
      ( clear b732 )
    )
  )
)
