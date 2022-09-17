( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b18 - block
    b652 - block
    b772 - block
    b189 - block
    b15 - block
    b165 - block
    b112 - block
    b441 - block
    b193 - block
    b711 - block
    b573 - block
    b443 - block
    b420 - block
    b619 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b18 )
    ( on b652 b18 )
    ( on b772 b652 )
    ( on b189 b772 )
    ( on b15 b189 )
    ( on b165 b15 )
    ( on b112 b165 )
    ( on b441 b112 )
    ( on b193 b441 )
    ( on b711 b193 )
    ( on b573 b711 )
    ( on b443 b573 )
    ( on b420 b443 )
    ( on b619 b420 )
    ( clear b619 )
  )
  ( :goal
    ( and
      ( clear b18 )
    )
  )
)
