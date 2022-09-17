( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b907 - block
    b377 - block
    b754 - block
    b987 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b907 )
    ( on b377 b907 )
    ( on b754 b377 )
    ( on b987 b754 )
    ( clear b987 )
  )
  ( :tasks
    ( Make-3Pile b377 b754 b987 )
  )
)
