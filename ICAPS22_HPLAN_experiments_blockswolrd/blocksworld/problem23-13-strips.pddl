( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b434 - block
    b387 - block
    b903 - block
    b336 - block
    b921 - block
    b237 - block
    b914 - block
    b552 - block
    b564 - block
    b565 - block
    b664 - block
    b825 - block
    b551 - block
    b461 - block
    b491 - block
    b877 - block
    b518 - block
    b726 - block
    b290 - block
    b702 - block
    b233 - block
    b108 - block
    b603 - block
    b319 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b434 )
    ( on b387 b434 )
    ( on b903 b387 )
    ( on b336 b903 )
    ( on b921 b336 )
    ( on b237 b921 )
    ( on b914 b237 )
    ( on b552 b914 )
    ( on b564 b552 )
    ( on b565 b564 )
    ( on b664 b565 )
    ( on b825 b664 )
    ( on b551 b825 )
    ( on b461 b551 )
    ( on b491 b461 )
    ( on b877 b491 )
    ( on b518 b877 )
    ( on b726 b518 )
    ( on b290 b726 )
    ( on b702 b290 )
    ( on b233 b702 )
    ( on b108 b233 )
    ( on b603 b108 )
    ( on b319 b603 )
    ( clear b319 )
  )
  ( :goal
    ( and
      ( clear b434 )
    )
  )
)
