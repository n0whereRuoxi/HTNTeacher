( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b845 - block
    b134 - block
    b62 - block
    b12 - block
    b515 - block
    b648 - block
    b411 - block
    b667 - block
    b734 - block
    b287 - block
    b462 - block
    b702 - block
    b2 - block
    b260 - block
    b110 - block
    b390 - block
    b967 - block
    b229 - block
    b809 - block
    b251 - block
    b124 - block
    b198 - block
    b215 - block
    b274 - block
    b609 - block
    b446 - block
    b700 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b845 )
    ( on b134 b845 )
    ( on b62 b134 )
    ( on b12 b62 )
    ( on b515 b12 )
    ( on b648 b515 )
    ( on b411 b648 )
    ( on b667 b411 )
    ( on b734 b667 )
    ( on b287 b734 )
    ( on b462 b287 )
    ( on b702 b462 )
    ( on b2 b702 )
    ( on b260 b2 )
    ( on b110 b260 )
    ( on b390 b110 )
    ( on b967 b390 )
    ( on b229 b967 )
    ( on b809 b229 )
    ( on b251 b809 )
    ( on b124 b251 )
    ( on b198 b124 )
    ( on b215 b198 )
    ( on b274 b215 )
    ( on b609 b274 )
    ( on b446 b609 )
    ( on b700 b446 )
    ( clear b700 )
  )
  ( :goal
    ( and
      ( clear b845 )
    )
  )
)
