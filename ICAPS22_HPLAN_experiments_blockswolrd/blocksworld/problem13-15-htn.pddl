( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b813 - block
    b614 - block
    b167 - block
    b271 - block
    b787 - block
    b323 - block
    b4 - block
    b75 - block
    b478 - block
    b424 - block
    b896 - block
    b916 - block
    b183 - block
    b711 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b813 )
    ( on b614 b813 )
    ( on b167 b614 )
    ( on b271 b167 )
    ( on b787 b271 )
    ( on b323 b787 )
    ( on b4 b323 )
    ( on b75 b4 )
    ( on b478 b75 )
    ( on b424 b478 )
    ( on b896 b424 )
    ( on b916 b896 )
    ( on b183 b916 )
    ( on b711 b183 )
    ( clear b711 )
  )
  ( :tasks
    ( Make-13Pile b614 b167 b271 b787 b323 b4 b75 b478 b424 b896 b916 b183 b711 )
  )
)
