( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b979 - block
    b936 - block
    b351 - block
    b294 - block
    b647 - block
    b389 - block
    b489 - block
    b522 - block
    b530 - block
    b976 - block
    b168 - block
    b61 - block
    b934 - block
    b921 - block
    b378 - block
    b266 - block
    b254 - block
    b350 - block
    b69 - block
    b208 - block
    b261 - block
    b691 - block
    b452 - block
    b722 - block
    b706 - block
    b506 - block
    b514 - block
    b354 - block
    b855 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b979 )
    ( on b936 b979 )
    ( on b351 b936 )
    ( on b294 b351 )
    ( on b647 b294 )
    ( on b389 b647 )
    ( on b489 b389 )
    ( on b522 b489 )
    ( on b530 b522 )
    ( on b976 b530 )
    ( on b168 b976 )
    ( on b61 b168 )
    ( on b934 b61 )
    ( on b921 b934 )
    ( on b378 b921 )
    ( on b266 b378 )
    ( on b254 b266 )
    ( on b350 b254 )
    ( on b69 b350 )
    ( on b208 b69 )
    ( on b261 b208 )
    ( on b691 b261 )
    ( on b452 b691 )
    ( on b722 b452 )
    ( on b706 b722 )
    ( on b506 b706 )
    ( on b514 b506 )
    ( on b354 b514 )
    ( on b855 b354 )
    ( clear b855 )
  )
  ( :tasks
    ( Make-28Pile b936 b351 b294 b647 b389 b489 b522 b530 b976 b168 b61 b934 b921 b378 b266 b254 b350 b69 b208 b261 b691 b452 b722 b706 b506 b514 b354 b855 )
  )
)
