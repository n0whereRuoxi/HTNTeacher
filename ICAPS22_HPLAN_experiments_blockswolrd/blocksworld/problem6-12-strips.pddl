( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b4 - block
    b967 - block
    b922 - block
    b383 - block
    b225 - block
    b419 - block
    b885 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b4 )
    ( on b967 b4 )
    ( on b922 b967 )
    ( on b383 b922 )
    ( on b225 b383 )
    ( on b419 b225 )
    ( on b885 b419 )
    ( clear b885 )
  )
  ( :goal
    ( and
      ( clear b4 )
    )
  )
)
