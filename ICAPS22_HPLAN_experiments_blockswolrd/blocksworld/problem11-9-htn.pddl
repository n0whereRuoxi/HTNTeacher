( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b946 - block
    b863 - block
    b56 - block
    b395 - block
    b550 - block
    b367 - block
    b376 - block
    b156 - block
    b982 - block
    b931 - block
    b559 - block
    b620 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b946 )
    ( on b863 b946 )
    ( on b56 b863 )
    ( on b395 b56 )
    ( on b550 b395 )
    ( on b367 b550 )
    ( on b376 b367 )
    ( on b156 b376 )
    ( on b982 b156 )
    ( on b931 b982 )
    ( on b559 b931 )
    ( on b620 b559 )
    ( clear b620 )
  )
  ( :tasks
    ( Make-11Pile b863 b56 b395 b550 b367 b376 b156 b982 b931 b559 b620 )
  )
)
