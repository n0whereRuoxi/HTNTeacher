( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b785 - block
    b710 - block
    b424 - block
    b302 - block
    b889 - block
    b334 - block
    b650 - block
    b968 - block
    b305 - block
    b380 - block
    b729 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b785 )
    ( on b710 b785 )
    ( on b424 b710 )
    ( on b302 b424 )
    ( on b889 b302 )
    ( on b334 b889 )
    ( on b650 b334 )
    ( on b968 b650 )
    ( on b305 b968 )
    ( on b380 b305 )
    ( on b729 b380 )
    ( on b381 b729 )
    ( clear b381 )
  )
  ( :goal
    ( and
      ( clear b785 )
    )
  )
)
