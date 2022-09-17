( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b175 - block
    b978 - block
    b252 - block
    b966 - block
    b413 - block
    b678 - block
    b31 - block
    b493 - block
    b184 - block
    b68 - block
    b17 - block
    b134 - block
    b447 - block
    b571 - block
    b748 - block
    b816 - block
    b494 - block
    b711 - block
    b674 - block
    b510 - block
    b395 - block
    b59 - block
    b546 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b175 )
    ( on b978 b175 )
    ( on b252 b978 )
    ( on b966 b252 )
    ( on b413 b966 )
    ( on b678 b413 )
    ( on b31 b678 )
    ( on b493 b31 )
    ( on b184 b493 )
    ( on b68 b184 )
    ( on b17 b68 )
    ( on b134 b17 )
    ( on b447 b134 )
    ( on b571 b447 )
    ( on b748 b571 )
    ( on b816 b748 )
    ( on b494 b816 )
    ( on b711 b494 )
    ( on b674 b711 )
    ( on b510 b674 )
    ( on b395 b510 )
    ( on b59 b395 )
    ( on b546 b59 )
    ( clear b546 )
  )
  ( :goal
    ( and
      ( clear b175 )
    )
  )
)
