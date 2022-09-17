( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b544 - block
    b179 - block
    b287 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b544 )
    ( on b179 b544 )
    ( on b287 b179 )
    ( clear b287 )
  )
  ( :goal
    ( and
      ( clear b544 )
    )
  )
)
