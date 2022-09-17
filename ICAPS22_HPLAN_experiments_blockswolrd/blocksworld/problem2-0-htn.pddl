( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b608 - block
    b529 - block
    b523 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b608 )
    ( on b529 b608 )
    ( on b523 b529 )
    ( clear b523 )
  )
  ( :tasks
    ( Make-2Pile b529 b523 )
  )
)
