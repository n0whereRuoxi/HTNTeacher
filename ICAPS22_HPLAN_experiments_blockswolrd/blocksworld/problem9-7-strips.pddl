( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b626 - block
    b560 - block
    b41 - block
    b121 - block
    b94 - block
    b332 - block
    b48 - block
    b344 - block
    b613 - block
    b823 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b626 )
    ( on b560 b626 )
    ( on b41 b560 )
    ( on b121 b41 )
    ( on b94 b121 )
    ( on b332 b94 )
    ( on b48 b332 )
    ( on b344 b48 )
    ( on b613 b344 )
    ( on b823 b613 )
    ( clear b823 )
  )
  ( :goal
    ( and
      ( clear b626 )
    )
  )
)
