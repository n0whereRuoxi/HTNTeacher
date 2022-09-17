( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b432 - block
    b652 - block
    b739 - block
    b119 - block
    b69 - block
    b223 - block
    b741 - block
    b179 - block
    b929 - block
    b645 - block
    b194 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b432 )
    ( on b652 b432 )
    ( on b739 b652 )
    ( on b119 b739 )
    ( on b69 b119 )
    ( on b223 b69 )
    ( on b741 b223 )
    ( on b179 b741 )
    ( on b929 b179 )
    ( on b645 b929 )
    ( on b194 b645 )
    ( clear b194 )
  )
  ( :goal
    ( and
      ( clear b432 )
    )
  )
)
