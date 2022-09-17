( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b917 - block
    b887 - block
    b79 - block
    b711 - block
    b303 - block
    b639 - block
    b840 - block
    b529 - block
    b358 - block
    b457 - block
    b2 - block
    b947 - block
    b870 - block
    b395 - block
    b215 - block
    b261 - block
    b842 - block
    b774 - block
    b141 - block
    b583 - block
    b929 - block
    b363 - block
    b908 - block
    b48 - block
    b687 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b917 )
    ( on b887 b917 )
    ( on b79 b887 )
    ( on b711 b79 )
    ( on b303 b711 )
    ( on b639 b303 )
    ( on b840 b639 )
    ( on b529 b840 )
    ( on b358 b529 )
    ( on b457 b358 )
    ( on b2 b457 )
    ( on b947 b2 )
    ( on b870 b947 )
    ( on b395 b870 )
    ( on b215 b395 )
    ( on b261 b215 )
    ( on b842 b261 )
    ( on b774 b842 )
    ( on b141 b774 )
    ( on b583 b141 )
    ( on b929 b583 )
    ( on b363 b929 )
    ( on b908 b363 )
    ( on b48 b908 )
    ( on b687 b48 )
    ( clear b687 )
  )
  ( :goal
    ( and
      ( clear b917 )
    )
  )
)
