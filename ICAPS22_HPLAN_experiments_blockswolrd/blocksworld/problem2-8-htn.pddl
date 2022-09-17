( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b986 - block
    b14 - block
    b115 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b986 )
    ( on b14 b986 )
    ( on b115 b14 )
    ( clear b115 )
  )
  ( :tasks
    ( Make-2Pile b14 b115 )
  )
)
