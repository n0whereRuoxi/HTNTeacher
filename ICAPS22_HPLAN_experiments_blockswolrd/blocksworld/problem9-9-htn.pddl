( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b991 - block
    b309 - block
    b976 - block
    b537 - block
    b722 - block
    b498 - block
    b747 - block
    b365 - block
    b892 - block
    b254 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b991 )
    ( on b309 b991 )
    ( on b976 b309 )
    ( on b537 b976 )
    ( on b722 b537 )
    ( on b498 b722 )
    ( on b747 b498 )
    ( on b365 b747 )
    ( on b892 b365 )
    ( on b254 b892 )
    ( clear b254 )
  )
  ( :tasks
    ( Make-9Pile b309 b976 b537 b722 b498 b747 b365 b892 b254 )
  )
)
