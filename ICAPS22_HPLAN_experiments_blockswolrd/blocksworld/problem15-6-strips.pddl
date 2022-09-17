( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b10 - block
    b378 - block
    b732 - block
    b282 - block
    b130 - block
    b570 - block
    b19 - block
    b614 - block
    b148 - block
    b765 - block
    b602 - block
    b411 - block
    b921 - block
    b844 - block
    b76 - block
    b374 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b10 )
    ( on b378 b10 )
    ( on b732 b378 )
    ( on b282 b732 )
    ( on b130 b282 )
    ( on b570 b130 )
    ( on b19 b570 )
    ( on b614 b19 )
    ( on b148 b614 )
    ( on b765 b148 )
    ( on b602 b765 )
    ( on b411 b602 )
    ( on b921 b411 )
    ( on b844 b921 )
    ( on b76 b844 )
    ( on b374 b76 )
    ( clear b374 )
  )
  ( :goal
    ( and
      ( clear b10 )
    )
  )
)
