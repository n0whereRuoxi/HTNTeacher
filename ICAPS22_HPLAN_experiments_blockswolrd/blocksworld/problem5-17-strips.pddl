( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b605 - block
    b926 - block
    b315 - block
    b201 - block
    b653 - block
    b415 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b605 )
    ( on b926 b605 )
    ( on b315 b926 )
    ( on b201 b315 )
    ( on b653 b201 )
    ( on b415 b653 )
    ( clear b415 )
  )
  ( :goal
    ( and
      ( clear b605 )
    )
  )
)
