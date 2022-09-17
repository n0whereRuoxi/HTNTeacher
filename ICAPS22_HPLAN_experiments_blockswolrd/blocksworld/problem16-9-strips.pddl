( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b31 - block
    b144 - block
    b81 - block
    b158 - block
    b641 - block
    b129 - block
    b587 - block
    b330 - block
    b888 - block
    b970 - block
    b667 - block
    b444 - block
    b947 - block
    b401 - block
    b765 - block
    b922 - block
    b251 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b31 )
    ( on b144 b31 )
    ( on b81 b144 )
    ( on b158 b81 )
    ( on b641 b158 )
    ( on b129 b641 )
    ( on b587 b129 )
    ( on b330 b587 )
    ( on b888 b330 )
    ( on b970 b888 )
    ( on b667 b970 )
    ( on b444 b667 )
    ( on b947 b444 )
    ( on b401 b947 )
    ( on b765 b401 )
    ( on b922 b765 )
    ( on b251 b922 )
    ( clear b251 )
  )
  ( :goal
    ( and
      ( clear b31 )
    )
  )
)
