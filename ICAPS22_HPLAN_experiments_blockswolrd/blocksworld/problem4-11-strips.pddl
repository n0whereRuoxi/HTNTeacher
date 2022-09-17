( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b154 - block
    b37 - block
    b544 - block
    b667 - block
    b223 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b154 )
    ( on b37 b154 )
    ( on b544 b37 )
    ( on b667 b544 )
    ( on b223 b667 )
    ( clear b223 )
  )
  ( :goal
    ( and
      ( clear b154 )
    )
  )
)
