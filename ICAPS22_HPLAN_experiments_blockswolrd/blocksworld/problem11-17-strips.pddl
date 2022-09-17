( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b722 - block
    b800 - block
    b939 - block
    b424 - block
    b217 - block
    b548 - block
    b971 - block
    b315 - block
    b691 - block
    b746 - block
    b824 - block
    b936 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b722 )
    ( on b800 b722 )
    ( on b939 b800 )
    ( on b424 b939 )
    ( on b217 b424 )
    ( on b548 b217 )
    ( on b971 b548 )
    ( on b315 b971 )
    ( on b691 b315 )
    ( on b746 b691 )
    ( on b824 b746 )
    ( on b936 b824 )
    ( clear b936 )
  )
  ( :goal
    ( and
      ( clear b722 )
    )
  )
)
