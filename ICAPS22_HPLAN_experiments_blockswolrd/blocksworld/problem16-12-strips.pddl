( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b748 - block
    b950 - block
    b366 - block
    b420 - block
    b512 - block
    b850 - block
    b933 - block
    b17 - block
    b747 - block
    b389 - block
    b401 - block
    b7 - block
    b218 - block
    b620 - block
    b247 - block
    b264 - block
    b524 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b748 )
    ( on b950 b748 )
    ( on b366 b950 )
    ( on b420 b366 )
    ( on b512 b420 )
    ( on b850 b512 )
    ( on b933 b850 )
    ( on b17 b933 )
    ( on b747 b17 )
    ( on b389 b747 )
    ( on b401 b389 )
    ( on b7 b401 )
    ( on b218 b7 )
    ( on b620 b218 )
    ( on b247 b620 )
    ( on b264 b247 )
    ( on b524 b264 )
    ( clear b524 )
  )
  ( :goal
    ( and
      ( clear b748 )
    )
  )
)
