( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b711 - block
    b172 - block
    b292 - block
    b947 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b711 )
    ( on b172 b711 )
    ( on b292 b172 )
    ( on b947 b292 )
    ( clear b947 )
  )
  ( :tasks
    ( Make-3Pile b172 b292 b947 )
  )
)
