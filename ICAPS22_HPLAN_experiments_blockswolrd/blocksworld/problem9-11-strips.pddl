( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b658 - block
    b539 - block
    b500 - block
    b847 - block
    b282 - block
    b423 - block
    b879 - block
    b280 - block
    b65 - block
    b707 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b658 )
    ( on b539 b658 )
    ( on b500 b539 )
    ( on b847 b500 )
    ( on b282 b847 )
    ( on b423 b282 )
    ( on b879 b423 )
    ( on b280 b879 )
    ( on b65 b280 )
    ( on b707 b65 )
    ( clear b707 )
  )
  ( :goal
    ( and
      ( clear b658 )
    )
  )
)
