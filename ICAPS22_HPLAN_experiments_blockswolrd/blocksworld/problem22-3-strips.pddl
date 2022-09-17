( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b633 - block
    b645 - block
    b954 - block
    b709 - block
    b858 - block
    b362 - block
    b440 - block
    b50 - block
    b683 - block
    b926 - block
    b9 - block
    b849 - block
    b370 - block
    b475 - block
    b929 - block
    b560 - block
    b285 - block
    b911 - block
    b309 - block
    b893 - block
    b939 - block
    b778 - block
    b55 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b633 )
    ( on b645 b633 )
    ( on b954 b645 )
    ( on b709 b954 )
    ( on b858 b709 )
    ( on b362 b858 )
    ( on b440 b362 )
    ( on b50 b440 )
    ( on b683 b50 )
    ( on b926 b683 )
    ( on b9 b926 )
    ( on b849 b9 )
    ( on b370 b849 )
    ( on b475 b370 )
    ( on b929 b475 )
    ( on b560 b929 )
    ( on b285 b560 )
    ( on b911 b285 )
    ( on b309 b911 )
    ( on b893 b309 )
    ( on b939 b893 )
    ( on b778 b939 )
    ( on b55 b778 )
    ( clear b55 )
  )
  ( :goal
    ( and
      ( clear b633 )
    )
  )
)
