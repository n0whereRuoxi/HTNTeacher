( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b243 - block
    b652 - block
    b31 - block
    b217 - block
    b889 - block
    b611 - block
    b340 - block
    b155 - block
    b273 - block
    b834 - block
    b613 - block
    b919 - block
    b953 - block
    b905 - block
    b807 - block
    b158 - block
    b373 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b243 )
    ( on b652 b243 )
    ( on b31 b652 )
    ( on b217 b31 )
    ( on b889 b217 )
    ( on b611 b889 )
    ( on b340 b611 )
    ( on b155 b340 )
    ( on b273 b155 )
    ( on b834 b273 )
    ( on b613 b834 )
    ( on b919 b613 )
    ( on b953 b919 )
    ( on b905 b953 )
    ( on b807 b905 )
    ( on b158 b807 )
    ( on b373 b158 )
    ( on b366 b373 )
    ( clear b366 )
  )
  ( :goal
    ( and
      ( clear b243 )
    )
  )
)
