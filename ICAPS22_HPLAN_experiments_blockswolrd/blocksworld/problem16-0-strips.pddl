( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b39 - block
    b812 - block
    b98 - block
    b525 - block
    b94 - block
    b358 - block
    b512 - block
    b256 - block
    b511 - block
    b968 - block
    b626 - block
    b399 - block
    b309 - block
    b791 - block
    b797 - block
    b930 - block
    b119 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b39 )
    ( on b812 b39 )
    ( on b98 b812 )
    ( on b525 b98 )
    ( on b94 b525 )
    ( on b358 b94 )
    ( on b512 b358 )
    ( on b256 b512 )
    ( on b511 b256 )
    ( on b968 b511 )
    ( on b626 b968 )
    ( on b399 b626 )
    ( on b309 b399 )
    ( on b791 b309 )
    ( on b797 b791 )
    ( on b930 b797 )
    ( on b119 b930 )
    ( clear b119 )
  )
  ( :goal
    ( and
      ( clear b39 )
    )
  )
)
