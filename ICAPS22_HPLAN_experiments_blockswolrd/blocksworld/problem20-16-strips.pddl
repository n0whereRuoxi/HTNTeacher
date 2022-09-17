( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b397 - block
    b983 - block
    b359 - block
    b882 - block
    b797 - block
    b684 - block
    b632 - block
    b607 - block
    b546 - block
    b694 - block
    b977 - block
    b539 - block
    b512 - block
    b984 - block
    b477 - block
    b518 - block
    b576 - block
    b280 - block
    b734 - block
    b346 - block
    b95 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b397 )
    ( on b983 b397 )
    ( on b359 b983 )
    ( on b882 b359 )
    ( on b797 b882 )
    ( on b684 b797 )
    ( on b632 b684 )
    ( on b607 b632 )
    ( on b546 b607 )
    ( on b694 b546 )
    ( on b977 b694 )
    ( on b539 b977 )
    ( on b512 b539 )
    ( on b984 b512 )
    ( on b477 b984 )
    ( on b518 b477 )
    ( on b576 b518 )
    ( on b280 b576 )
    ( on b734 b280 )
    ( on b346 b734 )
    ( on b95 b346 )
    ( clear b95 )
  )
  ( :goal
    ( and
      ( clear b397 )
    )
  )
)
