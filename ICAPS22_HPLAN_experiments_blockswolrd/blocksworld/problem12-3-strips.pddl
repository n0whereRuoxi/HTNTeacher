( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b41 - block
    b466 - block
    b740 - block
    b494 - block
    b10 - block
    b597 - block
    b629 - block
    b395 - block
    b22 - block
    b561 - block
    b842 - block
    b2 - block
    b651 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b41 )
    ( on b466 b41 )
    ( on b740 b466 )
    ( on b494 b740 )
    ( on b10 b494 )
    ( on b597 b10 )
    ( on b629 b597 )
    ( on b395 b629 )
    ( on b22 b395 )
    ( on b561 b22 )
    ( on b842 b561 )
    ( on b2 b842 )
    ( on b651 b2 )
    ( clear b651 )
  )
  ( :goal
    ( and
      ( clear b41 )
    )
  )
)
