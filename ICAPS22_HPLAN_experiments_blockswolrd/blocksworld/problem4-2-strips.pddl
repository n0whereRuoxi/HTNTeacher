( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b11 - block
    b780 - block
    b681 - block
    b512 - block
    b350 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b11 )
    ( on b780 b11 )
    ( on b681 b780 )
    ( on b512 b681 )
    ( on b350 b512 )
    ( clear b350 )
  )
  ( :goal
    ( and
      ( clear b11 )
    )
  )
)
