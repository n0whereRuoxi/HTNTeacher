( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b396 - block
    b576 - block
    b801 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b396 )
    ( on b576 b396 )
    ( on b801 b576 )
    ( clear b801 )
  )
  ( :tasks
    ( Make-2Pile b576 b801 )
  )
)
