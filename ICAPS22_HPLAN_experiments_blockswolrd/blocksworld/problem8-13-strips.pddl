( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b190 - block
    b728 - block
    b290 - block
    b495 - block
    b534 - block
    b560 - block
    b31 - block
    b737 - block
    b902 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b190 )
    ( on b728 b190 )
    ( on b290 b728 )
    ( on b495 b290 )
    ( on b534 b495 )
    ( on b560 b534 )
    ( on b31 b560 )
    ( on b737 b31 )
    ( on b902 b737 )
    ( clear b902 )
  )
  ( :goal
    ( and
      ( clear b190 )
    )
  )
)
