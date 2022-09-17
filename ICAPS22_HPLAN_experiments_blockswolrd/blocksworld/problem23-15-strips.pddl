( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b756 - block
    b449 - block
    b441 - block
    b557 - block
    b220 - block
    b709 - block
    b99 - block
    b466 - block
    b476 - block
    b608 - block
    b452 - block
    b540 - block
    b445 - block
    b620 - block
    b973 - block
    b390 - block
    b367 - block
    b963 - block
    b109 - block
    b198 - block
    b282 - block
    b775 - block
    b986 - block
    b424 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b756 )
    ( on b449 b756 )
    ( on b441 b449 )
    ( on b557 b441 )
    ( on b220 b557 )
    ( on b709 b220 )
    ( on b99 b709 )
    ( on b466 b99 )
    ( on b476 b466 )
    ( on b608 b476 )
    ( on b452 b608 )
    ( on b540 b452 )
    ( on b445 b540 )
    ( on b620 b445 )
    ( on b973 b620 )
    ( on b390 b973 )
    ( on b367 b390 )
    ( on b963 b367 )
    ( on b109 b963 )
    ( on b198 b109 )
    ( on b282 b198 )
    ( on b775 b282 )
    ( on b986 b775 )
    ( on b424 b986 )
    ( clear b424 )
  )
  ( :goal
    ( and
      ( clear b756 )
    )
  )
)
