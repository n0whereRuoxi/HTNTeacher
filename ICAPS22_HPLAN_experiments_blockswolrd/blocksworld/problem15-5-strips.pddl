( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b126 - block
    b141 - block
    b454 - block
    b704 - block
    b513 - block
    b210 - block
    b343 - block
    b518 - block
    b750 - block
    b736 - block
    b160 - block
    b738 - block
    b515 - block
    b67 - block
    b662 - block
    b124 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b126 )
    ( on b141 b126 )
    ( on b454 b141 )
    ( on b704 b454 )
    ( on b513 b704 )
    ( on b210 b513 )
    ( on b343 b210 )
    ( on b518 b343 )
    ( on b750 b518 )
    ( on b736 b750 )
    ( on b160 b736 )
    ( on b738 b160 )
    ( on b515 b738 )
    ( on b67 b515 )
    ( on b662 b67 )
    ( on b124 b662 )
    ( clear b124 )
  )
  ( :goal
    ( and
      ( clear b126 )
    )
  )
)
