( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b7 - block
    b680 - block
    b320 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b7 )
    ( on b680 b7 )
    ( on b320 b680 )
    ( clear b320 )
  )
  ( :goal
    ( and
      ( clear b7 )
    )
  )
)
