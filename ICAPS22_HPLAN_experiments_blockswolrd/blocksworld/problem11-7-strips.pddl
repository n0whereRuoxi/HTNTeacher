( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b790 - block
    b970 - block
    b254 - block
    b539 - block
    b215 - block
    b139 - block
    b730 - block
    b900 - block
    b163 - block
    b259 - block
    b392 - block
    b777 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b790 )
    ( on b970 b790 )
    ( on b254 b970 )
    ( on b539 b254 )
    ( on b215 b539 )
    ( on b139 b215 )
    ( on b730 b139 )
    ( on b900 b730 )
    ( on b163 b900 )
    ( on b259 b163 )
    ( on b392 b259 )
    ( on b777 b392 )
    ( clear b777 )
  )
  ( :goal
    ( and
      ( clear b790 )
    )
  )
)
