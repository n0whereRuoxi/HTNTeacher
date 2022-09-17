( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b636 - block
    b593 - block
    b69 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b636 )
    ( on b593 b636 )
    ( on b69 b593 )
    ( clear b69 )
  )
  ( :goal
    ( and
      ( clear b636 )
    )
  )
)
