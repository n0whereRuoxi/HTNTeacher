( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b404 - block
    b666 - block
    b380 - block
    b670 - block
    b23 - block
    b279 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b404 )
    ( on b666 b404 )
    ( on b380 b666 )
    ( on b670 b380 )
    ( on b23 b670 )
    ( on b279 b23 )
    ( clear b279 )
  )
  ( :goal
    ( and
      ( clear b404 )
    )
  )
)
