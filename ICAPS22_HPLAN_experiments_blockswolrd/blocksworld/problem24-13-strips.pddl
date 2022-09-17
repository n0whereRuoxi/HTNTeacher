( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b636 - block
    b252 - block
    b381 - block
    b594 - block
    b837 - block
    b680 - block
    b266 - block
    b201 - block
    b77 - block
    b263 - block
    b329 - block
    b125 - block
    b990 - block
    b20 - block
    b321 - block
    b254 - block
    b858 - block
    b676 - block
    b485 - block
    b725 - block
    b99 - block
    b581 - block
    b681 - block
    b455 - block
    b839 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b636 )
    ( on b252 b636 )
    ( on b381 b252 )
    ( on b594 b381 )
    ( on b837 b594 )
    ( on b680 b837 )
    ( on b266 b680 )
    ( on b201 b266 )
    ( on b77 b201 )
    ( on b263 b77 )
    ( on b329 b263 )
    ( on b125 b329 )
    ( on b990 b125 )
    ( on b20 b990 )
    ( on b321 b20 )
    ( on b254 b321 )
    ( on b858 b254 )
    ( on b676 b858 )
    ( on b485 b676 )
    ( on b725 b485 )
    ( on b99 b725 )
    ( on b581 b99 )
    ( on b681 b581 )
    ( on b455 b681 )
    ( on b839 b455 )
    ( clear b839 )
  )
  ( :goal
    ( and
      ( clear b636 )
    )
  )
)
