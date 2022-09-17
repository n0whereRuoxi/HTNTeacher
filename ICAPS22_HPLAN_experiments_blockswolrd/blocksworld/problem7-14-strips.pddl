( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b485 - block
    b337 - block
    b357 - block
    b800 - block
    b153 - block
    b943 - block
    b449 - block
    b283 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b485 )
    ( on b337 b485 )
    ( on b357 b337 )
    ( on b800 b357 )
    ( on b153 b800 )
    ( on b943 b153 )
    ( on b449 b943 )
    ( on b283 b449 )
    ( clear b283 )
  )
  ( :goal
    ( and
      ( clear b485 )
    )
  )
)
