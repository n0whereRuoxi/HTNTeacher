( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b459 - block
    b106 - block
    b58 - block
    b605 - block
    b169 - block
    b526 - block
    b894 - block
    b245 - block
    b99 - block
    b971 - block
    b476 - block
    b734 - block
    b334 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b459 )
    ( on b106 b459 )
    ( on b58 b106 )
    ( on b605 b58 )
    ( on b169 b605 )
    ( on b526 b169 )
    ( on b894 b526 )
    ( on b245 b894 )
    ( on b99 b245 )
    ( on b971 b99 )
    ( on b476 b971 )
    ( on b734 b476 )
    ( on b334 b734 )
    ( clear b334 )
  )
  ( :goal
    ( and
      ( clear b459 )
    )
  )
)
