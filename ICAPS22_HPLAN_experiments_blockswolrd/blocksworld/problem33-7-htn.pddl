( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b832 - block
    b770 - block
    b388 - block
    b471 - block
    b570 - block
    b888 - block
    b255 - block
    b677 - block
    b435 - block
    b635 - block
    b336 - block
    b478 - block
    b9 - block
    b124 - block
    b298 - block
    b489 - block
    b687 - block
    b811 - block
    b604 - block
    b980 - block
    b447 - block
    b801 - block
    b49 - block
    b287 - block
    b187 - block
    b47 - block
    b524 - block
    b368 - block
    b44 - block
    b135 - block
    b493 - block
    b85 - block
    b507 - block
    b642 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b832 )
    ( on b770 b832 )
    ( on b388 b770 )
    ( on b471 b388 )
    ( on b570 b471 )
    ( on b888 b570 )
    ( on b255 b888 )
    ( on b677 b255 )
    ( on b435 b677 )
    ( on b635 b435 )
    ( on b336 b635 )
    ( on b478 b336 )
    ( on b9 b478 )
    ( on b124 b9 )
    ( on b298 b124 )
    ( on b489 b298 )
    ( on b687 b489 )
    ( on b811 b687 )
    ( on b604 b811 )
    ( on b980 b604 )
    ( on b447 b980 )
    ( on b801 b447 )
    ( on b49 b801 )
    ( on b287 b49 )
    ( on b187 b287 )
    ( on b47 b187 )
    ( on b524 b47 )
    ( on b368 b524 )
    ( on b44 b368 )
    ( on b135 b44 )
    ( on b493 b135 )
    ( on b85 b493 )
    ( on b507 b85 )
    ( on b642 b507 )
    ( clear b642 )
  )
  ( :tasks
    ( Make-33Pile b770 b388 b471 b570 b888 b255 b677 b435 b635 b336 b478 b9 b124 b298 b489 b687 b811 b604 b980 b447 b801 b49 b287 b187 b47 b524 b368 b44 b135 b493 b85 b507 b642 )
  )
)
