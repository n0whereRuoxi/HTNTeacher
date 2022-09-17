( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b636 - block
    b593 - block
    b69 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b636 )
    ( on b593 b636 )
    ( on b69 b593 )
    ( clear b69 )
  )
  ( :tasks
    ( Make-2Pile b593 b69 )
  )
)
