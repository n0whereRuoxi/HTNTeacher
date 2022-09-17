( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b998 - block
    b435 - block
    b769 - block
    b805 - block
    b190 - block
    b950 - block
    b63 - block
    b609 - block
    b481 - block
    b983 - block
    b544 - block
    b99 - block
    b958 - block
    b537 - block
    b574 - block
    b116 - block
    b642 - block
    b84 - block
    b12 - block
    b647 - block
    b911 - block
    b667 - block
    b523 - block
    b134 - block
    b419 - block
    b456 - block
    b660 - block
    b664 - block
    b506 - block
    b311 - block
    b234 - block
    b328 - block
    b468 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b998 )
    ( on b435 b998 )
    ( on b769 b435 )
    ( on b805 b769 )
    ( on b190 b805 )
    ( on b950 b190 )
    ( on b63 b950 )
    ( on b609 b63 )
    ( on b481 b609 )
    ( on b983 b481 )
    ( on b544 b983 )
    ( on b99 b544 )
    ( on b958 b99 )
    ( on b537 b958 )
    ( on b574 b537 )
    ( on b116 b574 )
    ( on b642 b116 )
    ( on b84 b642 )
    ( on b12 b84 )
    ( on b647 b12 )
    ( on b911 b647 )
    ( on b667 b911 )
    ( on b523 b667 )
    ( on b134 b523 )
    ( on b419 b134 )
    ( on b456 b419 )
    ( on b660 b456 )
    ( on b664 b660 )
    ( on b506 b664 )
    ( on b311 b506 )
    ( on b234 b311 )
    ( on b328 b234 )
    ( on b468 b328 )
    ( clear b468 )
  )
  ( :goal
    ( and
      ( clear b998 )
    )
  )
)
