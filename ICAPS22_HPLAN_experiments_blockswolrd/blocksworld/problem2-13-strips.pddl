( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b791 - block
    b171 - block
    b766 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b791 )
    ( on b171 b791 )
    ( on b766 b171 )
    ( clear b766 )
  )
  ( :goal
    ( and
      ( clear b791 )
    )
  )
)
