( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b886 - block
    b118 - block
    b479 - block
    b526 - block
    b414 - block
    b206 - block
    b703 - block
    b90 - block
    b139 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b886 )
    ( on b118 b886 )
    ( on b479 b118 )
    ( on b526 b479 )
    ( on b414 b526 )
    ( on b206 b414 )
    ( on b703 b206 )
    ( on b90 b703 )
    ( on b139 b90 )
    ( clear b139 )
  )
  ( :tasks
    ( Make-8Pile b118 b479 b526 b414 b206 b703 b90 b139 )
  )
)
