( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b887 - block
    b234 - block
    b71 - block
    b836 - block
    b39 - block
    b966 - block
    b854 - block
    b72 - block
    b63 - block
    b343 - block
    b358 - block
    b232 - block
    b858 - block
    b837 - block
    b348 - block
    b133 - block
    b658 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b887 )
    ( on b234 b887 )
    ( on b71 b234 )
    ( on b836 b71 )
    ( on b39 b836 )
    ( on b966 b39 )
    ( on b854 b966 )
    ( on b72 b854 )
    ( on b63 b72 )
    ( on b343 b63 )
    ( on b358 b343 )
    ( on b232 b358 )
    ( on b858 b232 )
    ( on b837 b858 )
    ( on b348 b837 )
    ( on b133 b348 )
    ( on b658 b133 )
    ( clear b658 )
  )
  ( :tasks
    ( Make-16Pile b234 b71 b836 b39 b966 b854 b72 b63 b343 b358 b232 b858 b837 b348 b133 b658 )
  )
)
