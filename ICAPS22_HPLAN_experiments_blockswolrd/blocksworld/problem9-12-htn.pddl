( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b422 - block
    b806 - block
    b646 - block
    b878 - block
    b527 - block
    b582 - block
    b640 - block
    b523 - block
    b488 - block
    b1 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b422 )
    ( on b806 b422 )
    ( on b646 b806 )
    ( on b878 b646 )
    ( on b527 b878 )
    ( on b582 b527 )
    ( on b640 b582 )
    ( on b523 b640 )
    ( on b488 b523 )
    ( on b1 b488 )
    ( clear b1 )
  )
  ( :tasks
    ( Make-9Pile b806 b646 b878 b527 b582 b640 b523 b488 b1 )
  )
)
