( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b209 - block
    b368 - block
    b278 - block
    b663 - block
    b831 - block
    b327 - block
    b674 - block
    b6 - block
    b985 - block
    b485 - block
    b500 - block
    b619 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b209 )
    ( on b368 b209 )
    ( on b278 b368 )
    ( on b663 b278 )
    ( on b831 b663 )
    ( on b327 b831 )
    ( on b674 b327 )
    ( on b6 b674 )
    ( on b985 b6 )
    ( on b485 b985 )
    ( on b500 b485 )
    ( on b619 b500 )
    ( clear b619 )
  )
  ( :goal
    ( and
      ( clear b209 )
    )
  )
)
