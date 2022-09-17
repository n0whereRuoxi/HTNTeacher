( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b548 - block
    b727 - block
    b505 - block
    b968 - block
    b233 - block
    b870 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b548 )
    ( on b727 b548 )
    ( on b505 b727 )
    ( on b968 b505 )
    ( on b233 b968 )
    ( on b870 b233 )
    ( clear b870 )
  )
  ( :tasks
    ( Make-5Pile b727 b505 b968 b233 b870 )
  )
)
