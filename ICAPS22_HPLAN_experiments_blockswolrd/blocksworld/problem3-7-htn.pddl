( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b827 - block
    b997 - block
    b505 - block
    b110 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b827 )
    ( on b997 b827 )
    ( on b505 b997 )
    ( on b110 b505 )
    ( clear b110 )
  )
  ( :tasks
    ( Make-3Pile b997 b505 b110 )
  )
)
