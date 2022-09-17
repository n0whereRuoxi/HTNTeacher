( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b840 - block
    b518 - block
    b872 - block
    b434 - block
    b308 - block
    b728 - block
    b478 - block
    b427 - block
    b606 - block
    b180 - block
    b264 - block
    b614 - block
    b652 - block
    b474 - block
    b477 - block
    b217 - block
    b120 - block
    b445 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b840 )
    ( on b518 b840 )
    ( on b872 b518 )
    ( on b434 b872 )
    ( on b308 b434 )
    ( on b728 b308 )
    ( on b478 b728 )
    ( on b427 b478 )
    ( on b606 b427 )
    ( on b180 b606 )
    ( on b264 b180 )
    ( on b614 b264 )
    ( on b652 b614 )
    ( on b474 b652 )
    ( on b477 b474 )
    ( on b217 b477 )
    ( on b120 b217 )
    ( on b445 b120 )
    ( clear b445 )
  )
  ( :goal
    ( and
      ( clear b840 )
    )
  )
)
