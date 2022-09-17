( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b785 - block
    b693 - block
    b570 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b785 )
    ( on b693 b785 )
    ( on b570 b693 )
    ( clear b570 )
  )
  ( :tasks
    ( Make-2Pile b693 b570 )
  )
)
