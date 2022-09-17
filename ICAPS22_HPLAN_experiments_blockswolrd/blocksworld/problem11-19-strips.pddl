( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b402 - block
    b78 - block
    b274 - block
    b210 - block
    b837 - block
    b652 - block
    b812 - block
    b989 - block
    b400 - block
    b677 - block
    b379 - block
    b25 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b402 )
    ( on b78 b402 )
    ( on b274 b78 )
    ( on b210 b274 )
    ( on b837 b210 )
    ( on b652 b837 )
    ( on b812 b652 )
    ( on b989 b812 )
    ( on b400 b989 )
    ( on b677 b400 )
    ( on b379 b677 )
    ( on b25 b379 )
    ( clear b25 )
  )
  ( :goal
    ( and
      ( clear b402 )
    )
  )
)
