( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b751 - block
    b200 - block
    b864 - block
    b877 - block
    b70 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b751 )
    ( on b200 b751 )
    ( on b864 b200 )
    ( on b877 b864 )
    ( on b70 b877 )
    ( clear b70 )
  )
  ( :tasks
    ( Make-4Pile b200 b864 b877 b70 )
  )
)
