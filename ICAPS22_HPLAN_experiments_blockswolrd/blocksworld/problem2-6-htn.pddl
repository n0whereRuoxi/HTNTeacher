( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b740 - block
    b429 - block
    b106 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b740 )
    ( on b429 b740 )
    ( on b106 b429 )
    ( clear b106 )
  )
  ( :tasks
    ( Make-2Pile b429 b106 )
  )
)
