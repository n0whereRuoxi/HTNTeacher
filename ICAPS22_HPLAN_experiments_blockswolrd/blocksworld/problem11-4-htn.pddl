( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b66 - block
    b645 - block
    b709 - block
    b452 - block
    b654 - block
    b988 - block
    b55 - block
    b299 - block
    b328 - block
    b210 - block
    b136 - block
    b643 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b66 )
    ( on b645 b66 )
    ( on b709 b645 )
    ( on b452 b709 )
    ( on b654 b452 )
    ( on b988 b654 )
    ( on b55 b988 )
    ( on b299 b55 )
    ( on b328 b299 )
    ( on b210 b328 )
    ( on b136 b210 )
    ( on b643 b136 )
    ( clear b643 )
  )
  ( :tasks
    ( Make-11Pile b645 b709 b452 b654 b988 b55 b299 b328 b210 b136 b643 )
  )
)
