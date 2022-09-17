( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b602 - block
    b840 - block
    b421 - block
    b56 - block
    b764 - block
    b370 - block
    b5 - block
    b73 - block
    b756 - block
    b884 - block
    b496 - block
    b29 - block
    b483 - block
    b673 - block
    b291 - block
    b52 - block
    b187 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b602 )
    ( on b840 b602 )
    ( on b421 b840 )
    ( on b56 b421 )
    ( on b764 b56 )
    ( on b370 b764 )
    ( on b5 b370 )
    ( on b73 b5 )
    ( on b756 b73 )
    ( on b884 b756 )
    ( on b496 b884 )
    ( on b29 b496 )
    ( on b483 b29 )
    ( on b673 b483 )
    ( on b291 b673 )
    ( on b52 b291 )
    ( on b187 b52 )
    ( clear b187 )
  )
  ( :goal
    ( and
      ( clear b602 )
    )
  )
)
