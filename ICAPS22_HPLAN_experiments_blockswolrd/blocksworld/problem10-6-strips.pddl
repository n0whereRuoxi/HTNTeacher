( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b585 - block
    b399 - block
    b841 - block
    b269 - block
    b438 - block
    b65 - block
    b274 - block
    b775 - block
    b356 - block
    b434 - block
    b780 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b585 )
    ( on b399 b585 )
    ( on b841 b399 )
    ( on b269 b841 )
    ( on b438 b269 )
    ( on b65 b438 )
    ( on b274 b65 )
    ( on b775 b274 )
    ( on b356 b775 )
    ( on b434 b356 )
    ( on b780 b434 )
    ( clear b780 )
  )
  ( :goal
    ( and
      ( clear b585 )
    )
  )
)
