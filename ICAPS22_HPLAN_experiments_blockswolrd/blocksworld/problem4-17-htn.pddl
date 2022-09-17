( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b787 - block
    b360 - block
    b554 - block
    b377 - block
    b439 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b787 )
    ( on b360 b787 )
    ( on b554 b360 )
    ( on b377 b554 )
    ( on b439 b377 )
    ( clear b439 )
  )
  ( :tasks
    ( Make-4Pile b360 b554 b377 b439 )
  )
)
