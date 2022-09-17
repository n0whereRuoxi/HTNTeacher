( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b427 - block
    b511 - block
    b41 - block
    b758 - block
    b900 - block
    b412 - block
    b695 - block
    b458 - block
    b35 - block
    b888 - block
    b642 - block
    b90 - block
    b744 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b427 )
    ( on b511 b427 )
    ( on b41 b511 )
    ( on b758 b41 )
    ( on b900 b758 )
    ( on b412 b900 )
    ( on b695 b412 )
    ( on b458 b695 )
    ( on b35 b458 )
    ( on b888 b35 )
    ( on b642 b888 )
    ( on b90 b642 )
    ( on b744 b90 )
    ( clear b744 )
  )
  ( :tasks
    ( Make-12Pile b511 b41 b758 b900 b412 b695 b458 b35 b888 b642 b90 b744 )
  )
)
