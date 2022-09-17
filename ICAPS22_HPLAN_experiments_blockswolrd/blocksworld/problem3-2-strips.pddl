( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b550 - block
    b10 - block
    b711 - block
    b962 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b550 )
    ( on b10 b550 )
    ( on b711 b10 )
    ( on b962 b711 )
    ( clear b962 )
  )
  ( :goal
    ( and
      ( clear b550 )
    )
  )
)
