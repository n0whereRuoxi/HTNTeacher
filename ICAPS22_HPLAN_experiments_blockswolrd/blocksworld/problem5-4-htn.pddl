( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b950 - block
    b13 - block
    b291 - block
    b954 - block
    b244 - block
    b886 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b950 )
    ( on b13 b950 )
    ( on b291 b13 )
    ( on b954 b291 )
    ( on b244 b954 )
    ( on b886 b244 )
    ( clear b886 )
  )
  ( :tasks
    ( Make-5Pile b13 b291 b954 b244 b886 )
  )
)
