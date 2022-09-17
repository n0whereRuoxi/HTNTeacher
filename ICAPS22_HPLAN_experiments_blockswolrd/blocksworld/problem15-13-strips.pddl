( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b201 - block
    b953 - block
    b197 - block
    b511 - block
    b160 - block
    b414 - block
    b330 - block
    b112 - block
    b821 - block
    b634 - block
    b786 - block
    b192 - block
    b292 - block
    b900 - block
    b920 - block
    b746 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b201 )
    ( on b953 b201 )
    ( on b197 b953 )
    ( on b511 b197 )
    ( on b160 b511 )
    ( on b414 b160 )
    ( on b330 b414 )
    ( on b112 b330 )
    ( on b821 b112 )
    ( on b634 b821 )
    ( on b786 b634 )
    ( on b192 b786 )
    ( on b292 b192 )
    ( on b900 b292 )
    ( on b920 b900 )
    ( on b746 b920 )
    ( clear b746 )
  )
  ( :goal
    ( and
      ( clear b201 )
    )
  )
)
