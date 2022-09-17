( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b785 - block
    b693 - block
    b570 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b785 )
    ( on b693 b785 )
    ( on b570 b693 )
    ( clear b570 )
  )
  ( :goal
    ( and
      ( clear b785 )
    )
  )
)
