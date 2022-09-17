( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b511 - block
    b944 - block
    b508 - block
    b907 - block
    b654 - block
    b501 - block
    b134 - block
    b555 - block
    b745 - block
    b213 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b511 )
    ( on b944 b511 )
    ( on b508 b944 )
    ( on b907 b508 )
    ( on b654 b907 )
    ( on b501 b654 )
    ( on b134 b501 )
    ( on b555 b134 )
    ( on b745 b555 )
    ( on b213 b745 )
    ( clear b213 )
  )
  ( :goal
    ( and
      ( clear b511 )
    )
  )
)
