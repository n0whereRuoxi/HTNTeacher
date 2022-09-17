( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b447 - block
    b153 - block
    b758 - block
    b565 - block
    b778 - block
    b858 - block
    b495 - block
    b89 - block
    b135 - block
    b974 - block
    b687 - block
    b150 - block
    b336 - block
    b486 - block
    b998 - block
    b892 - block
    b570 - block
    b436 - block
    b682 - block
    b381 - block
    b431 - block
    b551 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b447 )
    ( on b153 b447 )
    ( on b758 b153 )
    ( on b565 b758 )
    ( on b778 b565 )
    ( on b858 b778 )
    ( on b495 b858 )
    ( on b89 b495 )
    ( on b135 b89 )
    ( on b974 b135 )
    ( on b687 b974 )
    ( on b150 b687 )
    ( on b336 b150 )
    ( on b486 b336 )
    ( on b998 b486 )
    ( on b892 b998 )
    ( on b570 b892 )
    ( on b436 b570 )
    ( on b682 b436 )
    ( on b381 b682 )
    ( on b431 b381 )
    ( on b551 b431 )
    ( clear b551 )
  )
  ( :goal
    ( and
      ( clear b447 )
    )
  )
)
