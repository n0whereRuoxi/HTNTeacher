( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b508 - block
    b916 - block
    b531 - block
    b106 - block
    b821 - block
    b78 - block
    b587 - block
    b193 - block
    b387 - block
    b665 - block
    b767 - block
    b825 - block
    b664 - block
    b304 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b508 )
    ( on b916 b508 )
    ( on b531 b916 )
    ( on b106 b531 )
    ( on b821 b106 )
    ( on b78 b821 )
    ( on b587 b78 )
    ( on b193 b587 )
    ( on b387 b193 )
    ( on b665 b387 )
    ( on b767 b665 )
    ( on b825 b767 )
    ( on b664 b825 )
    ( on b304 b664 )
    ( clear b304 )
  )
  ( :goal
    ( and
      ( clear b508 )
    )
  )
)
