( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b878 - block
    b358 - block
    b918 - block
    b703 - block
    b468 - block
    b967 - block
    b23 - block
    b448 - block
    b597 - block
    b328 - block
    b795 - block
    b435 - block
    b796 - block
    b305 - block
    b497 - block
    b451 - block
    b530 - block
    b250 - block
    b591 - block
    b244 - block
    b297 - block
    b103 - block
    b495 - block
    b428 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b878 )
    ( on b358 b878 )
    ( on b918 b358 )
    ( on b703 b918 )
    ( on b468 b703 )
    ( on b967 b468 )
    ( on b23 b967 )
    ( on b448 b23 )
    ( on b597 b448 )
    ( on b328 b597 )
    ( on b795 b328 )
    ( on b435 b795 )
    ( on b796 b435 )
    ( on b305 b796 )
    ( on b497 b305 )
    ( on b451 b497 )
    ( on b530 b451 )
    ( on b250 b530 )
    ( on b591 b250 )
    ( on b244 b591 )
    ( on b297 b244 )
    ( on b103 b297 )
    ( on b495 b103 )
    ( on b428 b495 )
    ( clear b428 )
  )
  ( :tasks
    ( Make-23Pile b358 b918 b703 b468 b967 b23 b448 b597 b328 b795 b435 b796 b305 b497 b451 b530 b250 b591 b244 b297 b103 b495 b428 )
  )
)
