( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b687 - block
    b39 - block
    b226 - block
    b545 - block
    b791 - block
    b250 - block
    b814 - block
    b72 - block
    b952 - block
    b83 - block
    b17 - block
    b256 - block
    b32 - block
    b70 - block
    b473 - block
    b401 - block
    b33 - block
    b743 - block
    b387 - block
    b884 - block
    b793 - block
    b86 - block
    b929 - block
    b288 - block
    b402 - block
    b603 - block
    b297 - block
    b559 - block
    b340 - block
    b600 - block
    b665 - block
    b980 - block
    b919 - block
    b990 - block
    b630 - block
    b69 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b687 )
    ( on b39 b687 )
    ( on b226 b39 )
    ( on b545 b226 )
    ( on b791 b545 )
    ( on b250 b791 )
    ( on b814 b250 )
    ( on b72 b814 )
    ( on b952 b72 )
    ( on b83 b952 )
    ( on b17 b83 )
    ( on b256 b17 )
    ( on b32 b256 )
    ( on b70 b32 )
    ( on b473 b70 )
    ( on b401 b473 )
    ( on b33 b401 )
    ( on b743 b33 )
    ( on b387 b743 )
    ( on b884 b387 )
    ( on b793 b884 )
    ( on b86 b793 )
    ( on b929 b86 )
    ( on b288 b929 )
    ( on b402 b288 )
    ( on b603 b402 )
    ( on b297 b603 )
    ( on b559 b297 )
    ( on b340 b559 )
    ( on b600 b340 )
    ( on b665 b600 )
    ( on b980 b665 )
    ( on b919 b980 )
    ( on b990 b919 )
    ( on b630 b990 )
    ( on b69 b630 )
    ( clear b69 )
  )
  ( :goal
    ( and
      ( clear b687 )
    )
  )
)
