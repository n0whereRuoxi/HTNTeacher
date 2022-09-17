( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b988 - block
    b118 - block
    b632 - block
    b366 - block
    b954 - block
    b211 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b988 )
    ( on b118 b988 )
    ( on b632 b118 )
    ( on b366 b632 )
    ( on b954 b366 )
    ( on b211 b954 )
    ( on b15 b211 )
    ( clear b15 )
  )
  ( :goal
    ( and
      ( clear b988 )
    )
  )
)
