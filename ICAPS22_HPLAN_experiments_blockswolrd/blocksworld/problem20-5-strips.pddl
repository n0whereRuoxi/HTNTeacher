( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b955 - block
    b436 - block
    b613 - block
    b765 - block
    b647 - block
    b370 - block
    b453 - block
    b178 - block
    b888 - block
    b496 - block
    b674 - block
    b661 - block
    b212 - block
    b412 - block
    b777 - block
    b39 - block
    b907 - block
    b557 - block
    b521 - block
    b80 - block
    b418 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b955 )
    ( on b436 b955 )
    ( on b613 b436 )
    ( on b765 b613 )
    ( on b647 b765 )
    ( on b370 b647 )
    ( on b453 b370 )
    ( on b178 b453 )
    ( on b888 b178 )
    ( on b496 b888 )
    ( on b674 b496 )
    ( on b661 b674 )
    ( on b212 b661 )
    ( on b412 b212 )
    ( on b777 b412 )
    ( on b39 b777 )
    ( on b907 b39 )
    ( on b557 b907 )
    ( on b521 b557 )
    ( on b80 b521 )
    ( on b418 b80 )
    ( clear b418 )
  )
  ( :goal
    ( and
      ( clear b955 )
    )
  )
)
