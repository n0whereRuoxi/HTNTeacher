( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b562 - block
    b149 - block
    b432 - block
    b421 - block
    b533 - block
    b85 - block
    b722 - block
    b429 - block
    b455 - block
    b957 - block
    b179 - block
    b540 - block
    b170 - block
    b424 - block
    b527 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b562 )
    ( on b149 b562 )
    ( on b432 b149 )
    ( on b421 b432 )
    ( on b533 b421 )
    ( on b85 b533 )
    ( on b722 b85 )
    ( on b429 b722 )
    ( on b455 b429 )
    ( on b957 b455 )
    ( on b179 b957 )
    ( on b540 b179 )
    ( on b170 b540 )
    ( on b424 b170 )
    ( on b527 b424 )
    ( clear b527 )
  )
  ( :tasks
    ( Make-14Pile b149 b432 b421 b533 b85 b722 b429 b455 b957 b179 b540 b170 b424 b527 )
  )
)
