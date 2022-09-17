( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b328 - block
    b190 - block
    b524 - block
    b471 - block
    b20 - block
    b443 - block
    b739 - block
    b531 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b328 )
    ( on b190 b328 )
    ( on b524 b190 )
    ( on b471 b524 )
    ( on b20 b471 )
    ( on b443 b20 )
    ( on b739 b443 )
    ( on b531 b739 )
    ( clear b531 )
  )
  ( :tasks
    ( Make-7Pile b190 b524 b471 b20 b443 b739 b531 )
  )
)
