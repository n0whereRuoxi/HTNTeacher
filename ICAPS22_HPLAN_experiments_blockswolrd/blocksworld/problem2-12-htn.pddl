( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b869 - block
    b331 - block
    b236 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b869 )
    ( on b331 b869 )
    ( on b236 b331 )
    ( clear b236 )
  )
  ( :tasks
    ( Make-2Pile b331 b236 )
  )
)
