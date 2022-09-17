( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b984 - block
    b381 - block
    b313 - block
    b516 - block
    b576 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b984 )
    ( on b381 b984 )
    ( on b313 b381 )
    ( on b516 b313 )
    ( on b576 b516 )
    ( clear b576 )
  )
  ( :goal
    ( and
      ( clear b984 )
    )
  )
)
