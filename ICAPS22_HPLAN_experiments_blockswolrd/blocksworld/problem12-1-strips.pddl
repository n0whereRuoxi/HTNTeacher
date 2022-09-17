( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b344 - block
    b113 - block
    b385 - block
    b706 - block
    b225 - block
    b952 - block
    b278 - block
    b709 - block
    b320 - block
    b453 - block
    b419 - block
    b290 - block
    b780 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b344 )
    ( on b113 b344 )
    ( on b385 b113 )
    ( on b706 b385 )
    ( on b225 b706 )
    ( on b952 b225 )
    ( on b278 b952 )
    ( on b709 b278 )
    ( on b320 b709 )
    ( on b453 b320 )
    ( on b419 b453 )
    ( on b290 b419 )
    ( on b780 b290 )
    ( clear b780 )
  )
  ( :goal
    ( and
      ( clear b344 )
    )
  )
)
