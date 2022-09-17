( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b865 - block
    b925 - block
    b345 - block
    b824 - block
    b167 - block
    b887 - block
    b418 - block
    b450 - block
    b559 - block
    b283 - block
    b19 - block
    b100 - block
    b429 - block
    b85 - block
    b225 - block
    b287 - block
    b209 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b865 )
    ( on b925 b865 )
    ( on b345 b925 )
    ( on b824 b345 )
    ( on b167 b824 )
    ( on b887 b167 )
    ( on b418 b887 )
    ( on b450 b418 )
    ( on b559 b450 )
    ( on b283 b559 )
    ( on b19 b283 )
    ( on b100 b19 )
    ( on b429 b100 )
    ( on b85 b429 )
    ( on b225 b85 )
    ( on b287 b225 )
    ( on b209 b287 )
    ( clear b209 )
  )
  ( :goal
    ( and
      ( clear b865 )
    )
  )
)
