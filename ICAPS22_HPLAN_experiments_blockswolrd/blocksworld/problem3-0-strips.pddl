( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b547 - block
    b494 - block
    b568 - block
    b376 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b547 )
    ( on b494 b547 )
    ( on b568 b494 )
    ( on b376 b568 )
    ( clear b376 )
  )
  ( :goal
    ( and
      ( clear b547 )
    )
  )
)