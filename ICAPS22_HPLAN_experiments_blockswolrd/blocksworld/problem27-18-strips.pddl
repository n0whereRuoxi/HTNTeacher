( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b177 - block
    b946 - block
    b484 - block
    b247 - block
    b370 - block
    b540 - block
    b531 - block
    b686 - block
    b52 - block
    b494 - block
    b868 - block
    b744 - block
    b792 - block
    b176 - block
    b289 - block
    b683 - block
    b772 - block
    b435 - block
    b462 - block
    b967 - block
    b28 - block
    b60 - block
    b944 - block
    b379 - block
    b454 - block
    b711 - block
    b501 - block
    b158 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b177 )
    ( on b946 b177 )
    ( on b484 b946 )
    ( on b247 b484 )
    ( on b370 b247 )
    ( on b540 b370 )
    ( on b531 b540 )
    ( on b686 b531 )
    ( on b52 b686 )
    ( on b494 b52 )
    ( on b868 b494 )
    ( on b744 b868 )
    ( on b792 b744 )
    ( on b176 b792 )
    ( on b289 b176 )
    ( on b683 b289 )
    ( on b772 b683 )
    ( on b435 b772 )
    ( on b462 b435 )
    ( on b967 b462 )
    ( on b28 b967 )
    ( on b60 b28 )
    ( on b944 b60 )
    ( on b379 b944 )
    ( on b454 b379 )
    ( on b711 b454 )
    ( on b501 b711 )
    ( on b158 b501 )
    ( clear b158 )
  )
  ( :goal
    ( and
      ( clear b177 )
    )
  )
)
