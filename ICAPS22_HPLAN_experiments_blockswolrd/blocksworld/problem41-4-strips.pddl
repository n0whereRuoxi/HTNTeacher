( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b921 - block
    b427 - block
    b20 - block
    b294 - block
    b446 - block
    b765 - block
    b145 - block
    b237 - block
    b760 - block
    b153 - block
    b336 - block
    b916 - block
    b358 - block
    b548 - block
    b472 - block
    b970 - block
    b875 - block
    b166 - block
    b640 - block
    b349 - block
    b653 - block
    b795 - block
    b198 - block
    b54 - block
    b796 - block
    b697 - block
    b565 - block
    b700 - block
    b783 - block
    b901 - block
    b759 - block
    b269 - block
    b898 - block
    b637 - block
    b882 - block
    b618 - block
    b533 - block
    b879 - block
    b767 - block
    b390 - block
    b97 - block
    b699 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b921 )
    ( on b427 b921 )
    ( on b20 b427 )
    ( on b294 b20 )
    ( on b446 b294 )
    ( on b765 b446 )
    ( on b145 b765 )
    ( on b237 b145 )
    ( on b760 b237 )
    ( on b153 b760 )
    ( on b336 b153 )
    ( on b916 b336 )
    ( on b358 b916 )
    ( on b548 b358 )
    ( on b472 b548 )
    ( on b970 b472 )
    ( on b875 b970 )
    ( on b166 b875 )
    ( on b640 b166 )
    ( on b349 b640 )
    ( on b653 b349 )
    ( on b795 b653 )
    ( on b198 b795 )
    ( on b54 b198 )
    ( on b796 b54 )
    ( on b697 b796 )
    ( on b565 b697 )
    ( on b700 b565 )
    ( on b783 b700 )
    ( on b901 b783 )
    ( on b759 b901 )
    ( on b269 b759 )
    ( on b898 b269 )
    ( on b637 b898 )
    ( on b882 b637 )
    ( on b618 b882 )
    ( on b533 b618 )
    ( on b879 b533 )
    ( on b767 b879 )
    ( on b390 b767 )
    ( on b97 b390 )
    ( on b699 b97 )
    ( clear b699 )
  )
  ( :goal
    ( and
      ( clear b921 )
    )
  )
)
