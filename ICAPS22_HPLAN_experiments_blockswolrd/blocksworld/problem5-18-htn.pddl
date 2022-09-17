( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b778 - block
    b857 - block
    b893 - block
    b461 - block
    b520 - block
    b48 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b778 )
    ( on b857 b778 )
    ( on b893 b857 )
    ( on b461 b893 )
    ( on b520 b461 )
    ( on b48 b520 )
    ( clear b48 )
  )
  ( :tasks
    ( Make-5Pile b857 b893 b461 b520 b48 )
  )
)
