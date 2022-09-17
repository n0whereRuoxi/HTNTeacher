( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b734 - block
    b455 - block
    b705 - block
    b666 - block
    b634 - block
    b471 - block
    b516 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b734 )
    ( on b455 b734 )
    ( on b705 b455 )
    ( on b666 b705 )
    ( on b634 b666 )
    ( on b471 b634 )
    ( on b516 b471 )
    ( clear b516 )
  )
  ( :tasks
    ( Make-6Pile b455 b705 b666 b634 b471 b516 )
  )
)
