( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b551 - block
    b206 - block
    b38 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b551 )
    ( on b206 b551 )
    ( on b38 b206 )
    ( clear b38 )
  )
  ( :tasks
    ( Make-2Pile b206 b38 )
  )
)
