( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b349 - block
    b207 - block
    b547 - block
    b518 - block
    b555 - block
    b729 - block
    b21 - block
    b456 - block
    b309 - block
    b41 - block
    b26 - block
    b929 - block
    b237 - block
    b711 - block
    b77 - block
    b451 - block
    b315 - block
    b749 - block
    b78 - block
    b714 - block
    b676 - block
    b954 - block
    b996 - block
    b686 - block
    b503 - block
    b98 - block
    b276 - block
    b393 - block
    b117 - block
    b832 - block
    b243 - block
    b345 - block
    b284 - block
    b14 - block
    b479 - block
    b7 - block
    b993 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b349 )
    ( on b207 b349 )
    ( on b547 b207 )
    ( on b518 b547 )
    ( on b555 b518 )
    ( on b729 b555 )
    ( on b21 b729 )
    ( on b456 b21 )
    ( on b309 b456 )
    ( on b41 b309 )
    ( on b26 b41 )
    ( on b929 b26 )
    ( on b237 b929 )
    ( on b711 b237 )
    ( on b77 b711 )
    ( on b451 b77 )
    ( on b315 b451 )
    ( on b749 b315 )
    ( on b78 b749 )
    ( on b714 b78 )
    ( on b676 b714 )
    ( on b954 b676 )
    ( on b996 b954 )
    ( on b686 b996 )
    ( on b503 b686 )
    ( on b98 b503 )
    ( on b276 b98 )
    ( on b393 b276 )
    ( on b117 b393 )
    ( on b832 b117 )
    ( on b243 b832 )
    ( on b345 b243 )
    ( on b284 b345 )
    ( on b14 b284 )
    ( on b479 b14 )
    ( on b7 b479 )
    ( on b993 b7 )
    ( clear b993 )
  )
  ( :goal
    ( and
      ( clear b349 )
    )
  )
)
