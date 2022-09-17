( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b566 - block
    b669 - block
    b48 - block
    b321 - block
    b765 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b566 )
    ( on b669 b566 )
    ( on b48 b669 )
    ( on b321 b48 )
    ( on b765 b321 )
    ( clear b765 )
  )
  ( :tasks
    ( Make-4Pile b669 b48 b321 b765 )
  )
)
