( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b102 - block
    b964 - block
    b874 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b102 )
    ( on b964 b102 )
    ( on b874 b964 )
    ( clear b874 )
  )
  ( :tasks
    ( Make-2Pile b964 b874 )
  )
)
