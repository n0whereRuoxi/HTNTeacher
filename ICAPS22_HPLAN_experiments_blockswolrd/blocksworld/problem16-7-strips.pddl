( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b764 - block
    b624 - block
    b880 - block
    b680 - block
    b6 - block
    b118 - block
    b836 - block
    b333 - block
    b647 - block
    b322 - block
    b747 - block
    b231 - block
    b295 - block
    b557 - block
    b361 - block
    b921 - block
    b439 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b764 )
    ( on b624 b764 )
    ( on b880 b624 )
    ( on b680 b880 )
    ( on b6 b680 )
    ( on b118 b6 )
    ( on b836 b118 )
    ( on b333 b836 )
    ( on b647 b333 )
    ( on b322 b647 )
    ( on b747 b322 )
    ( on b231 b747 )
    ( on b295 b231 )
    ( on b557 b295 )
    ( on b361 b557 )
    ( on b921 b361 )
    ( on b439 b921 )
    ( clear b439 )
  )
  ( :goal
    ( and
      ( clear b764 )
    )
  )
)
