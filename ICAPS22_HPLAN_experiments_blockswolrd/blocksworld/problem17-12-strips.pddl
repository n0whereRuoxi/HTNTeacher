( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b954 - block
    b16 - block
    b673 - block
    b465 - block
    b698 - block
    b497 - block
    b423 - block
    b296 - block
    b270 - block
    b950 - block
    b49 - block
    b796 - block
    b36 - block
    b826 - block
    b887 - block
    b293 - block
    b10 - block
    b84 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b954 )
    ( on b16 b954 )
    ( on b673 b16 )
    ( on b465 b673 )
    ( on b698 b465 )
    ( on b497 b698 )
    ( on b423 b497 )
    ( on b296 b423 )
    ( on b270 b296 )
    ( on b950 b270 )
    ( on b49 b950 )
    ( on b796 b49 )
    ( on b36 b796 )
    ( on b826 b36 )
    ( on b887 b826 )
    ( on b293 b887 )
    ( on b10 b293 )
    ( on b84 b10 )
    ( clear b84 )
  )
  ( :goal
    ( and
      ( clear b954 )
    )
  )
)
