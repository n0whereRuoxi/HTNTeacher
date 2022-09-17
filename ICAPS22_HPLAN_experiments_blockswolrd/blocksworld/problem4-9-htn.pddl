( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b199 - block
    b171 - block
    b640 - block
    b932 - block
    b715 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b199 )
    ( on b171 b199 )
    ( on b640 b171 )
    ( on b932 b640 )
    ( on b715 b932 )
    ( clear b715 )
  )
  ( :tasks
    ( Make-4Pile b171 b640 b932 b715 )
  )
)
