( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b320 - block
    b698 - block
    b847 - block
    b58 - block
    b709 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b320 )
    ( on b698 b320 )
    ( on b847 b698 )
    ( on b58 b847 )
    ( on b709 b58 )
    ( clear b709 )
  )
  ( :tasks
    ( Make-4Pile b698 b847 b58 b709 )
  )
)
