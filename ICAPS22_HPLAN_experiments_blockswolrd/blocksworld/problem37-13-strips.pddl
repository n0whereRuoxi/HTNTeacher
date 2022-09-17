( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b881 - block
    b409 - block
    b463 - block
    b735 - block
    b306 - block
    b176 - block
    b301 - block
    b247 - block
    b575 - block
    b912 - block
    b1 - block
    b201 - block
    b516 - block
    b561 - block
    b970 - block
    b591 - block
    b124 - block
    b47 - block
    b640 - block
    b189 - block
    b936 - block
    b129 - block
    b358 - block
    b77 - block
    b265 - block
    b937 - block
    b914 - block
    b642 - block
    b581 - block
    b515 - block
    b456 - block
    b318 - block
    b439 - block
    b665 - block
    b804 - block
    b134 - block
    b527 - block
    b179 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b881 )
    ( on b409 b881 )
    ( on b463 b409 )
    ( on b735 b463 )
    ( on b306 b735 )
    ( on b176 b306 )
    ( on b301 b176 )
    ( on b247 b301 )
    ( on b575 b247 )
    ( on b912 b575 )
    ( on b1 b912 )
    ( on b201 b1 )
    ( on b516 b201 )
    ( on b561 b516 )
    ( on b970 b561 )
    ( on b591 b970 )
    ( on b124 b591 )
    ( on b47 b124 )
    ( on b640 b47 )
    ( on b189 b640 )
    ( on b936 b189 )
    ( on b129 b936 )
    ( on b358 b129 )
    ( on b77 b358 )
    ( on b265 b77 )
    ( on b937 b265 )
    ( on b914 b937 )
    ( on b642 b914 )
    ( on b581 b642 )
    ( on b515 b581 )
    ( on b456 b515 )
    ( on b318 b456 )
    ( on b439 b318 )
    ( on b665 b439 )
    ( on b804 b665 )
    ( on b134 b804 )
    ( on b527 b134 )
    ( on b179 b527 )
    ( clear b179 )
  )
  ( :goal
    ( and
      ( clear b881 )
    )
  )
)
