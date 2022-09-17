( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b818 - block
    b882 - block
    b491 - block
    b363 - block
    b359 - block
    b438 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b818 )
    ( on b882 b818 )
    ( on b491 b882 )
    ( on b363 b491 )
    ( on b359 b363 )
    ( on b438 b359 )
    ( clear b438 )
  )
  ( :goal
    ( and
      ( clear b818 )
    )
  )
)
