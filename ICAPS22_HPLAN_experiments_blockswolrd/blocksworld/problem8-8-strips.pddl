( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b413 - block
    b593 - block
    b383 - block
    b362 - block
    b231 - block
    b240 - block
    b905 - block
    b74 - block
    b370 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b413 )
    ( on b593 b413 )
    ( on b383 b593 )
    ( on b362 b383 )
    ( on b231 b362 )
    ( on b240 b231 )
    ( on b905 b240 )
    ( on b74 b905 )
    ( on b370 b74 )
    ( clear b370 )
  )
  ( :goal
    ( and
      ( clear b413 )
    )
  )
)
