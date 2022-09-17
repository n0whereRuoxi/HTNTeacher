( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b285 - block
    b339 - block
    b108 - block
    b869 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b285 )
    ( on b339 b285 )
    ( on b108 b339 )
    ( on b869 b108 )
    ( clear b869 )
  )
  ( :tasks
    ( Make-3Pile b339 b108 b869 )
  )
)
