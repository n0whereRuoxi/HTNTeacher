( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b288 - block
    b706 - block
    b311 - block
    b877 - block
    b334 - block
    b36 - block
    b512 - block
    b633 - block
    b205 - block
    b47 - block
    b421 - block
    b695 - block
    b604 - block
    b221 - block
    b597 - block
    b344 - block
    b13 - block
    b232 - block
    b458 - block
    b714 - block
    b23 - block
    b990 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b288 )
    ( on b706 b288 )
    ( on b311 b706 )
    ( on b877 b311 )
    ( on b334 b877 )
    ( on b36 b334 )
    ( on b512 b36 )
    ( on b633 b512 )
    ( on b205 b633 )
    ( on b47 b205 )
    ( on b421 b47 )
    ( on b695 b421 )
    ( on b604 b695 )
    ( on b221 b604 )
    ( on b597 b221 )
    ( on b344 b597 )
    ( on b13 b344 )
    ( on b232 b13 )
    ( on b458 b232 )
    ( on b714 b458 )
    ( on b23 b714 )
    ( on b990 b23 )
    ( clear b990 )
  )
  ( :goal
    ( and
      ( clear b288 )
    )
  )
)
