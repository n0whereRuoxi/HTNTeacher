( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b595 - block
    b506 - block
    b557 - block
    b18 - block
    b405 - block
    b729 - block
    b243 - block
    b606 - block
    b578 - block
    b788 - block
    b837 - block
    b697 - block
    b650 - block
    b404 - block
    b950 - block
    b817 - block
    b414 - block
    b226 - block
    b188 - block
    b180 - block
    b800 - block
    b755 - block
    b190 - block
    b382 - block
    b814 - block
    b90 - block
    b379 - block
    b935 - block
    b50 - block
    b502 - block
    b144 - block
    b164 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b595 )
    ( on b506 b595 )
    ( on b557 b506 )
    ( on b18 b557 )
    ( on b405 b18 )
    ( on b729 b405 )
    ( on b243 b729 )
    ( on b606 b243 )
    ( on b578 b606 )
    ( on b788 b578 )
    ( on b837 b788 )
    ( on b697 b837 )
    ( on b650 b697 )
    ( on b404 b650 )
    ( on b950 b404 )
    ( on b817 b950 )
    ( on b414 b817 )
    ( on b226 b414 )
    ( on b188 b226 )
    ( on b180 b188 )
    ( on b800 b180 )
    ( on b755 b800 )
    ( on b190 b755 )
    ( on b382 b190 )
    ( on b814 b382 )
    ( on b90 b814 )
    ( on b379 b90 )
    ( on b935 b379 )
    ( on b50 b935 )
    ( on b502 b50 )
    ( on b144 b502 )
    ( on b164 b144 )
    ( clear b164 )
  )
  ( :goal
    ( and
      ( clear b595 )
    )
  )
)
