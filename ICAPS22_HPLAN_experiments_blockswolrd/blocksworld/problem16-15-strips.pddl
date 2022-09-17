( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b381 - block
    b617 - block
    b252 - block
    b796 - block
    b72 - block
    b968 - block
    b331 - block
    b721 - block
    b535 - block
    b306 - block
    b944 - block
    b821 - block
    b197 - block
    b668 - block
    b1 - block
    b78 - block
    b16 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b381 )
    ( on b617 b381 )
    ( on b252 b617 )
    ( on b796 b252 )
    ( on b72 b796 )
    ( on b968 b72 )
    ( on b331 b968 )
    ( on b721 b331 )
    ( on b535 b721 )
    ( on b306 b535 )
    ( on b944 b306 )
    ( on b821 b944 )
    ( on b197 b821 )
    ( on b668 b197 )
    ( on b1 b668 )
    ( on b78 b1 )
    ( on b16 b78 )
    ( clear b16 )
  )
  ( :goal
    ( and
      ( clear b381 )
    )
  )
)
