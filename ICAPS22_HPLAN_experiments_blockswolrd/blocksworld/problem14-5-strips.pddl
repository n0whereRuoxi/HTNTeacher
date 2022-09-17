( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b93 - block
    b727 - block
    b474 - block
    b381 - block
    b12 - block
    b734 - block
    b404 - block
    b750 - block
    b634 - block
    b426 - block
    b571 - block
    b546 - block
    b817 - block
    b928 - block
    b265 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b93 )
    ( on b727 b93 )
    ( on b474 b727 )
    ( on b381 b474 )
    ( on b12 b381 )
    ( on b734 b12 )
    ( on b404 b734 )
    ( on b750 b404 )
    ( on b634 b750 )
    ( on b426 b634 )
    ( on b571 b426 )
    ( on b546 b571 )
    ( on b817 b546 )
    ( on b928 b817 )
    ( on b265 b928 )
    ( clear b265 )
  )
  ( :goal
    ( and
      ( clear b93 )
    )
  )
)
