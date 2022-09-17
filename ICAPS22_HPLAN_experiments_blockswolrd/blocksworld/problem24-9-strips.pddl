( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b910 - block
    b374 - block
    b478 - block
    b771 - block
    b698 - block
    b824 - block
    b122 - block
    b60 - block
    b253 - block
    b745 - block
    b748 - block
    b427 - block
    b4 - block
    b118 - block
    b847 - block
    b193 - block
    b439 - block
    b655 - block
    b522 - block
    b45 - block
    b419 - block
    b154 - block
    b328 - block
    b617 - block
    b931 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b910 )
    ( on b374 b910 )
    ( on b478 b374 )
    ( on b771 b478 )
    ( on b698 b771 )
    ( on b824 b698 )
    ( on b122 b824 )
    ( on b60 b122 )
    ( on b253 b60 )
    ( on b745 b253 )
    ( on b748 b745 )
    ( on b427 b748 )
    ( on b4 b427 )
    ( on b118 b4 )
    ( on b847 b118 )
    ( on b193 b847 )
    ( on b439 b193 )
    ( on b655 b439 )
    ( on b522 b655 )
    ( on b45 b522 )
    ( on b419 b45 )
    ( on b154 b419 )
    ( on b328 b154 )
    ( on b617 b328 )
    ( on b931 b617 )
    ( clear b931 )
  )
  ( :goal
    ( and
      ( clear b910 )
    )
  )
)
