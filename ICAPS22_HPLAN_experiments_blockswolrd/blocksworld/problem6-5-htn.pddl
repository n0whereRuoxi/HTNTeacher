( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b585 - block
    b685 - block
    b728 - block
    b282 - block
    b314 - block
    b260 - block
    b885 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b585 )
    ( on b685 b585 )
    ( on b728 b685 )
    ( on b282 b728 )
    ( on b314 b282 )
    ( on b260 b314 )
    ( on b885 b260 )
    ( clear b885 )
  )
  ( :tasks
    ( Make-6Pile b685 b728 b282 b314 b260 b885 )
  )
)
