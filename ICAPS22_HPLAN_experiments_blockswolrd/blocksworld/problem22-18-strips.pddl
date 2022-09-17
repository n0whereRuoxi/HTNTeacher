( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b305 - block
    b545 - block
    b849 - block
    b761 - block
    b901 - block
    b817 - block
    b307 - block
    b444 - block
    b794 - block
    b812 - block
    b621 - block
    b361 - block
    b261 - block
    b377 - block
    b752 - block
    b171 - block
    b202 - block
    b224 - block
    b150 - block
    b400 - block
    b994 - block
    b600 - block
    b974 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b305 )
    ( on b545 b305 )
    ( on b849 b545 )
    ( on b761 b849 )
    ( on b901 b761 )
    ( on b817 b901 )
    ( on b307 b817 )
    ( on b444 b307 )
    ( on b794 b444 )
    ( on b812 b794 )
    ( on b621 b812 )
    ( on b361 b621 )
    ( on b261 b361 )
    ( on b377 b261 )
    ( on b752 b377 )
    ( on b171 b752 )
    ( on b202 b171 )
    ( on b224 b202 )
    ( on b150 b224 )
    ( on b400 b150 )
    ( on b994 b400 )
    ( on b600 b994 )
    ( on b974 b600 )
    ( clear b974 )
  )
  ( :goal
    ( and
      ( clear b305 )
    )
  )
)
