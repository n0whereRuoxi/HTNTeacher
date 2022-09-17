( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b639 - block
    b205 - block
    b853 - block
    b539 - block
    b13 - block
    b11 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b639 )
    ( on b205 b639 )
    ( on b853 b205 )
    ( on b539 b853 )
    ( on b13 b539 )
    ( on b11 b13 )
    ( clear b11 )
  )
  ( :tasks
    ( Make-5Pile b205 b853 b539 b13 b11 )
  )
)
