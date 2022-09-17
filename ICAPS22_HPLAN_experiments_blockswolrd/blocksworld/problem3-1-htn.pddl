( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b825 - block
    b778 - block
    b958 - block
    b377 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b825 )
    ( on b778 b825 )
    ( on b958 b778 )
    ( on b377 b958 )
    ( clear b377 )
  )
  ( :tasks
    ( Make-3Pile b778 b958 b377 )
  )
)
