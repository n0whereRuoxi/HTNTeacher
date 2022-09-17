( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b696 - block
    b470 - block
    b469 - block
    b166 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b696 )
    ( on b470 b696 )
    ( on b469 b470 )
    ( on b166 b469 )
    ( clear b166 )
  )
  ( :tasks
    ( Make-3Pile b470 b469 b166 )
  )
)
