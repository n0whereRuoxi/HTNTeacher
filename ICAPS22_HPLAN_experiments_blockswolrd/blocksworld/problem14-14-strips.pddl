( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b532 - block
    b164 - block
    b464 - block
    b916 - block
    b232 - block
    b870 - block
    b666 - block
    b579 - block
    b950 - block
    b368 - block
    b316 - block
    b557 - block
    b801 - block
    b503 - block
    b373 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b532 )
    ( on b164 b532 )
    ( on b464 b164 )
    ( on b916 b464 )
    ( on b232 b916 )
    ( on b870 b232 )
    ( on b666 b870 )
    ( on b579 b666 )
    ( on b950 b579 )
    ( on b368 b950 )
    ( on b316 b368 )
    ( on b557 b316 )
    ( on b801 b557 )
    ( on b503 b801 )
    ( on b373 b503 )
    ( clear b373 )
  )
  ( :goal
    ( and
      ( clear b532 )
    )
  )
)
