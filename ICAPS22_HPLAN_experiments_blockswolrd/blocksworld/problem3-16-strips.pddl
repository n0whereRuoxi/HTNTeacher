( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b918 - block
    b107 - block
    b78 - block
    b247 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b918 )
    ( on b107 b918 )
    ( on b78 b107 )
    ( on b247 b78 )
    ( clear b247 )
  )
  ( :goal
    ( and
      ( clear b918 )
    )
  )
)
