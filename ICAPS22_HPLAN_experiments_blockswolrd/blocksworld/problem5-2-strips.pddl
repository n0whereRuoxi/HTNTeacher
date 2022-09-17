( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b975 - block
    b702 - block
    b845 - block
    b727 - block
    b619 - block
    b927 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b975 )
    ( on b702 b975 )
    ( on b845 b702 )
    ( on b727 b845 )
    ( on b619 b727 )
    ( on b927 b619 )
    ( clear b927 )
  )
  ( :goal
    ( and
      ( clear b975 )
    )
  )
)
