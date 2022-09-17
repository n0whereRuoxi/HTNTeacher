( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b752 - block
    b703 - block
    b610 - block
    b507 - block
    b284 - block
    b66 - block
    b309 - block
    b783 - block
    b675 - block
    b647 - block
    b389 - block
    b788 - block
    b988 - block
    b864 - block
    b378 - block
    b51 - block
    b727 - block
    b976 - block
    b494 - block
    b825 - block
    b547 - block
    b283 - block
    b490 - block
    b86 - block
    b603 - block
    b201 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b752 )
    ( on b703 b752 )
    ( on b610 b703 )
    ( on b507 b610 )
    ( on b284 b507 )
    ( on b66 b284 )
    ( on b309 b66 )
    ( on b783 b309 )
    ( on b675 b783 )
    ( on b647 b675 )
    ( on b389 b647 )
    ( on b788 b389 )
    ( on b988 b788 )
    ( on b864 b988 )
    ( on b378 b864 )
    ( on b51 b378 )
    ( on b727 b51 )
    ( on b976 b727 )
    ( on b494 b976 )
    ( on b825 b494 )
    ( on b547 b825 )
    ( on b283 b547 )
    ( on b490 b283 )
    ( on b86 b490 )
    ( on b603 b86 )
    ( on b201 b603 )
    ( clear b201 )
  )
  ( :goal
    ( and
      ( clear b752 )
    )
  )
)
