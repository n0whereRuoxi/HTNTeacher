( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b473 - block
    b940 - block
    b534 - block
    b288 - block
    b503 - block
    b929 - block
    b3 - block
    b518 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b473 )
    ( on b940 b473 )
    ( on b534 b940 )
    ( on b288 b534 )
    ( on b503 b288 )
    ( on b929 b503 )
    ( on b3 b929 )
    ( on b518 b3 )
    ( clear b518 )
  )
  ( :goal
    ( and
      ( clear b473 )
    )
  )
)
