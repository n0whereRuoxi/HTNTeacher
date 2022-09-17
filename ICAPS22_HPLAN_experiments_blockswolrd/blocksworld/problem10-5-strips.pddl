( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b72 - block
    b575 - block
    b676 - block
    b318 - block
    b110 - block
    b953 - block
    b876 - block
    b430 - block
    b111 - block
    b353 - block
    b625 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b72 )
    ( on b575 b72 )
    ( on b676 b575 )
    ( on b318 b676 )
    ( on b110 b318 )
    ( on b953 b110 )
    ( on b876 b953 )
    ( on b430 b876 )
    ( on b111 b430 )
    ( on b353 b111 )
    ( on b625 b353 )
    ( clear b625 )
  )
  ( :goal
    ( and
      ( clear b72 )
    )
  )
)
