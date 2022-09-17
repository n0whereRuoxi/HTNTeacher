( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b597 - block
    b109 - block
    b907 - block
    b494 - block
    b208 - block
    b836 - block
    b67 - block
    b44 - block
    b174 - block
    b629 - block
    b298 - block
    b746 - block
    b39 - block
    b921 - block
    b472 - block
    b969 - block
    b691 - block
    b785 - block
    b954 - block
    b917 - block
    b908 - block
    b996 - block
    b118 - block
    b128 - block
    b605 - block
    b771 - block
    b280 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b597 )
    ( on b109 b597 )
    ( on b907 b109 )
    ( on b494 b907 )
    ( on b208 b494 )
    ( on b836 b208 )
    ( on b67 b836 )
    ( on b44 b67 )
    ( on b174 b44 )
    ( on b629 b174 )
    ( on b298 b629 )
    ( on b746 b298 )
    ( on b39 b746 )
    ( on b921 b39 )
    ( on b472 b921 )
    ( on b969 b472 )
    ( on b691 b969 )
    ( on b785 b691 )
    ( on b954 b785 )
    ( on b917 b954 )
    ( on b908 b917 )
    ( on b996 b908 )
    ( on b118 b996 )
    ( on b128 b118 )
    ( on b605 b128 )
    ( on b771 b605 )
    ( on b280 b771 )
    ( clear b280 )
  )
  ( :goal
    ( and
      ( clear b597 )
    )
  )
)
