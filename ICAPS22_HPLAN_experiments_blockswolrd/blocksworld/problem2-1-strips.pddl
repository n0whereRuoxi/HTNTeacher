( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b70 - block
    b128 - block
    b192 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b70 )
    ( on b128 b70 )
    ( on b192 b128 )
    ( clear b192 )
  )
  ( :goal
    ( and
      ( clear b70 )
    )
  )
)
