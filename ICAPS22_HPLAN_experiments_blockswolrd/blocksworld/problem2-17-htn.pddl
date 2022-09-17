( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b782 - block
    b270 - block
    b271 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b782 )
    ( on b270 b782 )
    ( on b271 b270 )
    ( clear b271 )
  )
  ( :tasks
    ( Make-2Pile b270 b271 )
  )
)
