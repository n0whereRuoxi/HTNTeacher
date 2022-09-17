( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b704 - block
    b711 - block
    b87 - block
    b37 - block
    b348 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b704 )
    ( on b711 b704 )
    ( on b87 b711 )
    ( on b37 b87 )
    ( on b348 b37 )
    ( clear b348 )
  )
  ( :tasks
    ( Make-4Pile b711 b87 b37 b348 )
  )
)
