( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b714 - block
    b91 - block
    b114 - block
    b930 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b714 )
    ( on b91 b714 )
    ( on b114 b91 )
    ( on b930 b114 )
    ( clear b930 )
  )
  ( :tasks
    ( Make-3Pile b91 b114 b930 )
  )
)
