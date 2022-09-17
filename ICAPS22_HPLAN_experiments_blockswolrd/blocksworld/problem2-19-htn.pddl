( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b704 - block
    b800 - block
    b43 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b704 )
    ( on b800 b704 )
    ( on b43 b800 )
    ( clear b43 )
  )
  ( :tasks
    ( Make-2Pile b800 b43 )
  )
)
