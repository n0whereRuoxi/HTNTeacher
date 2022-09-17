( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b167 - block
    b286 - block
    b232 - block
    b957 - block
    b918 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b167 )
    ( on b286 b167 )
    ( on b232 b286 )
    ( on b957 b232 )
    ( on b918 b957 )
    ( clear b918 )
  )
  ( :tasks
    ( Make-4Pile b286 b232 b957 b918 )
  )
)
