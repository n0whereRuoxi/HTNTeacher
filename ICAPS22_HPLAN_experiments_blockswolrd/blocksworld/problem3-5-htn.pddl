( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b342 - block
    b127 - block
    b573 - block
    b167 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b342 )
    ( on b127 b342 )
    ( on b573 b127 )
    ( on b167 b573 )
    ( clear b167 )
  )
  ( :tasks
    ( Make-3Pile b127 b573 b167 )
  )
)
