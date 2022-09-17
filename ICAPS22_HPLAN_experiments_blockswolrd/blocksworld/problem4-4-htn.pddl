( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b213 - block
    b250 - block
    b415 - block
    b952 - block
    b155 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b213 )
    ( on b250 b213 )
    ( on b415 b250 )
    ( on b952 b415 )
    ( on b155 b952 )
    ( clear b155 )
  )
  ( :tasks
    ( Make-4Pile b250 b415 b952 b155 )
  )
)
