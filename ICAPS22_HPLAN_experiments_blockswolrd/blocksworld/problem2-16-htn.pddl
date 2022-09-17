( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b94 - block
    b201 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b94 )
    ( on b201 b94 )
    ( on b233 b201 )
    ( clear b233 )
  )
  ( :tasks
    ( Make-2Pile b201 b233 )
  )
)
