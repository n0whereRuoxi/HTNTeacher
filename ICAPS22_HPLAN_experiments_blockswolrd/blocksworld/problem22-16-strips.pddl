( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b374 - block
    b204 - block
    b958 - block
    b9 - block
    b882 - block
    b276 - block
    b424 - block
    b983 - block
    b600 - block
    b484 - block
    b763 - block
    b132 - block
    b392 - block
    b621 - block
    b599 - block
    b780 - block
    b508 - block
    b700 - block
    b197 - block
    b95 - block
    b943 - block
    b345 - block
    b400 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b374 )
    ( on b204 b374 )
    ( on b958 b204 )
    ( on b9 b958 )
    ( on b882 b9 )
    ( on b276 b882 )
    ( on b424 b276 )
    ( on b983 b424 )
    ( on b600 b983 )
    ( on b484 b600 )
    ( on b763 b484 )
    ( on b132 b763 )
    ( on b392 b132 )
    ( on b621 b392 )
    ( on b599 b621 )
    ( on b780 b599 )
    ( on b508 b780 )
    ( on b700 b508 )
    ( on b197 b700 )
    ( on b95 b197 )
    ( on b943 b95 )
    ( on b345 b943 )
    ( on b400 b345 )
    ( clear b400 )
  )
  ( :goal
    ( and
      ( clear b374 )
    )
  )
)
