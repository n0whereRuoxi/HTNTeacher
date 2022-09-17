( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b997 - block
    b726 - block
    b355 - block
    b633 - block
    b983 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b997 )
    ( on b726 b997 )
    ( on b355 b726 )
    ( on b633 b355 )
    ( on b983 b633 )
    ( clear b983 )
  )
  ( :goal
    ( and
      ( clear b997 )
    )
  )
)
