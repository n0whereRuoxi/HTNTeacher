( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b110 - block
    b525 - block
    b322 - block
    b230 - block
    b509 - block
    b731 - block
    b524 - block
    b429 - block
    b512 - block
    b76 - block
    b802 - block
    b638 - block
    b696 - block
    b515 - block
    b422 - block
    b315 - block
    b528 - block
    b581 - block
    b67 - block
    b123 - block
    b668 - block
    b598 - block
    b490 - block
    b755 - block
    b873 - block
    b78 - block
    b892 - block
    b775 - block
    b308 - block
    b600 - block
    b527 - block
    b662 - block
    b271 - block
    b313 - block
    b533 - block
    b831 - block
    b688 - block
    b462 - block
    b51 - block
    b137 - block
    b805 - block
    b878 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b110 )
    ( on b525 b110 )
    ( on b322 b525 )
    ( on b230 b322 )
    ( on b509 b230 )
    ( on b731 b509 )
    ( on b524 b731 )
    ( on b429 b524 )
    ( on b512 b429 )
    ( on b76 b512 )
    ( on b802 b76 )
    ( on b638 b802 )
    ( on b696 b638 )
    ( on b515 b696 )
    ( on b422 b515 )
    ( on b315 b422 )
    ( on b528 b315 )
    ( on b581 b528 )
    ( on b67 b581 )
    ( on b123 b67 )
    ( on b668 b123 )
    ( on b598 b668 )
    ( on b490 b598 )
    ( on b755 b490 )
    ( on b873 b755 )
    ( on b78 b873 )
    ( on b892 b78 )
    ( on b775 b892 )
    ( on b308 b775 )
    ( on b600 b308 )
    ( on b527 b600 )
    ( on b662 b527 )
    ( on b271 b662 )
    ( on b313 b271 )
    ( on b533 b313 )
    ( on b831 b533 )
    ( on b688 b831 )
    ( on b462 b688 )
    ( on b51 b462 )
    ( on b137 b51 )
    ( on b805 b137 )
    ( on b878 b805 )
    ( clear b878 )
  )
  ( :goal
    ( and
      ( clear b110 )
    )
  )
)
