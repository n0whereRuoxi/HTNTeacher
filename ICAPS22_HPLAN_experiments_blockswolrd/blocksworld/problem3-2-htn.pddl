( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
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
  ( :tasks
    ( Make-3Pile b10 b711 b962 )
  )
)
