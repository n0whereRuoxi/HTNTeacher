( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b521 - block
    b914 - block
    b752 - block
    b477 - block
    b79 - block
    b335 - block
    b809 - block
    b571 - block
    b707 - block
    b318 - block
    b358 - block
    b355 - block
    b800 - block
    b749 - block
    b19 - block
    b334 - block
    b814 - block
    b850 - block
    b530 - block
    b459 - block
    b883 - block
    b653 - block
    b568 - block
    b271 - block
    b67 - block
    b854 - block
    b657 - block
    b48 - block
    b801 - block
    b849 - block
    b694 - block
    b145 - block
    b617 - block
    b488 - block
    b777 - block
    b559 - block
    b909 - block
    b1 - block
    b97 - block
    b405 - block
    b659 - block
    b374 - block
    b31 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b521 )
    ( on b914 b521 )
    ( on b752 b914 )
    ( on b477 b752 )
    ( on b79 b477 )
    ( on b335 b79 )
    ( on b809 b335 )
    ( on b571 b809 )
    ( on b707 b571 )
    ( on b318 b707 )
    ( on b358 b318 )
    ( on b355 b358 )
    ( on b800 b355 )
    ( on b749 b800 )
    ( on b19 b749 )
    ( on b334 b19 )
    ( on b814 b334 )
    ( on b850 b814 )
    ( on b530 b850 )
    ( on b459 b530 )
    ( on b883 b459 )
    ( on b653 b883 )
    ( on b568 b653 )
    ( on b271 b568 )
    ( on b67 b271 )
    ( on b854 b67 )
    ( on b657 b854 )
    ( on b48 b657 )
    ( on b801 b48 )
    ( on b849 b801 )
    ( on b694 b849 )
    ( on b145 b694 )
    ( on b617 b145 )
    ( on b488 b617 )
    ( on b777 b488 )
    ( on b559 b777 )
    ( on b909 b559 )
    ( on b1 b909 )
    ( on b97 b1 )
    ( on b405 b97 )
    ( on b659 b405 )
    ( on b374 b659 )
    ( on b31 b374 )
    ( clear b31 )
  )
  ( :goal
    ( and
      ( clear b521 )
    )
  )
)
