( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b927 - block
    b551 - block
    b783 - block
    b623 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b927 )
    ( on b551 b927 )
    ( on b783 b551 )
    ( on b623 b783 )
    ( clear b623 )
  )
  ( :tasks
    ( Make-3Pile b551 b783 b623 )
  )
)
