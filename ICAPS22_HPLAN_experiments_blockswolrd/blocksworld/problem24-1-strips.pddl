( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b362 - block
    b340 - block
    b502 - block
    b7 - block
    b433 - block
    b868 - block
    b904 - block
    b592 - block
    b222 - block
    b136 - block
    b52 - block
    b910 - block
    b522 - block
    b520 - block
    b303 - block
    b787 - block
    b22 - block
    b669 - block
    b811 - block
    b702 - block
    b653 - block
    b308 - block
    b168 - block
    b208 - block
    b753 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b362 )
    ( on b340 b362 )
    ( on b502 b340 )
    ( on b7 b502 )
    ( on b433 b7 )
    ( on b868 b433 )
    ( on b904 b868 )
    ( on b592 b904 )
    ( on b222 b592 )
    ( on b136 b222 )
    ( on b52 b136 )
    ( on b910 b52 )
    ( on b522 b910 )
    ( on b520 b522 )
    ( on b303 b520 )
    ( on b787 b303 )
    ( on b22 b787 )
    ( on b669 b22 )
    ( on b811 b669 )
    ( on b702 b811 )
    ( on b653 b702 )
    ( on b308 b653 )
    ( on b168 b308 )
    ( on b208 b168 )
    ( on b753 b208 )
    ( clear b753 )
  )
  ( :goal
    ( and
      ( clear b362 )
    )
  )
)
