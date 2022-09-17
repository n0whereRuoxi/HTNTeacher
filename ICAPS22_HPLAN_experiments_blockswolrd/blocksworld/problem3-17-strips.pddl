( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b513 - block
    b734 - block
    b423 - block
    b200 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b513 )
    ( on b734 b513 )
    ( on b423 b734 )
    ( on b200 b423 )
    ( clear b200 )
  )
  ( :goal
    ( and
      ( clear b513 )
    )
  )
)
