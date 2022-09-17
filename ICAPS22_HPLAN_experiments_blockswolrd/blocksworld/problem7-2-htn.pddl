( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b798 - block
    b711 - block
    b833 - block
    b840 - block
    b106 - block
    b747 - block
    b430 - block
    b329 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b798 )
    ( on b711 b798 )
    ( on b833 b711 )
    ( on b840 b833 )
    ( on b106 b840 )
    ( on b747 b106 )
    ( on b430 b747 )
    ( on b329 b430 )
    ( clear b329 )
  )
  ( :tasks
    ( Make-7Pile b711 b833 b840 b106 b747 b430 b329 )
  )
)
