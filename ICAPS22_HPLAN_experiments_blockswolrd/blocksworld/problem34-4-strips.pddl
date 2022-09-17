( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b180 - block
    b1 - block
    b184 - block
    b252 - block
    b845 - block
    b244 - block
    b721 - block
    b853 - block
    b960 - block
    b388 - block
    b631 - block
    b17 - block
    b839 - block
    b996 - block
    b68 - block
    b550 - block
    b95 - block
    b454 - block
    b757 - block
    b524 - block
    b797 - block
    b86 - block
    b481 - block
    b582 - block
    b298 - block
    b959 - block
    b649 - block
    b441 - block
    b56 - block
    b189 - block
    b989 - block
    b31 - block
    b857 - block
    b412 - block
    b350 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b180 )
    ( on b1 b180 )
    ( on b184 b1 )
    ( on b252 b184 )
    ( on b845 b252 )
    ( on b244 b845 )
    ( on b721 b244 )
    ( on b853 b721 )
    ( on b960 b853 )
    ( on b388 b960 )
    ( on b631 b388 )
    ( on b17 b631 )
    ( on b839 b17 )
    ( on b996 b839 )
    ( on b68 b996 )
    ( on b550 b68 )
    ( on b95 b550 )
    ( on b454 b95 )
    ( on b757 b454 )
    ( on b524 b757 )
    ( on b797 b524 )
    ( on b86 b797 )
    ( on b481 b86 )
    ( on b582 b481 )
    ( on b298 b582 )
    ( on b959 b298 )
    ( on b649 b959 )
    ( on b441 b649 )
    ( on b56 b441 )
    ( on b189 b56 )
    ( on b989 b189 )
    ( on b31 b989 )
    ( on b857 b31 )
    ( on b412 b857 )
    ( on b350 b412 )
    ( clear b350 )
  )
  ( :goal
    ( and
      ( clear b180 )
    )
  )
)
