( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b658 - block
    b381 - block
    b474 - block
    b639 - block
    b502 - block
    b493 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b658 )
    ( on b381 b658 )
    ( on b474 b381 )
    ( on b639 b474 )
    ( on b502 b639 )
    ( on b493 b502 )
    ( clear b493 )
  )
  ( :goal
    ( and
      ( clear b658 )
    )
  )
)
