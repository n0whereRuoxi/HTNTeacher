( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b500 - block
    b969 - block
    b526 - block
    b909 - block
    b869 - block
    b535 - block
    b777 - block
    b709 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b500 )
    ( on b969 b500 )
    ( on b526 b969 )
    ( on b909 b526 )
    ( on b869 b909 )
    ( on b535 b869 )
    ( on b777 b535 )
    ( on b709 b777 )
    ( clear b709 )
  )
  ( :tasks
    ( Make-7Pile b969 b526 b909 b869 b535 b777 b709 )
  )
)
