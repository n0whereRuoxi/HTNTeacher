( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b899 - block
    b438 - block
    b412 - block
    b547 - block
    b320 - block
    b542 - block
    b964 - block
    b583 - block
    b990 - block
    b782 - block
    b997 - block
    b886 - block
    b259 - block
    b276 - block
    b111 - block
    b64 - block
    b379 - block
    b7 - block
    b667 - block
    b963 - block
    b953 - block
    b511 - block
    b213 - block
    b222 - block
    b447 - block
    b344 - block
    b448 - block
    b710 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b899 )
    ( on b438 b899 )
    ( on b412 b438 )
    ( on b547 b412 )
    ( on b320 b547 )
    ( on b542 b320 )
    ( on b964 b542 )
    ( on b583 b964 )
    ( on b990 b583 )
    ( on b782 b990 )
    ( on b997 b782 )
    ( on b886 b997 )
    ( on b259 b886 )
    ( on b276 b259 )
    ( on b111 b276 )
    ( on b64 b111 )
    ( on b379 b64 )
    ( on b7 b379 )
    ( on b667 b7 )
    ( on b963 b667 )
    ( on b953 b963 )
    ( on b511 b953 )
    ( on b213 b511 )
    ( on b222 b213 )
    ( on b447 b222 )
    ( on b344 b447 )
    ( on b448 b344 )
    ( on b710 b448 )
    ( clear b710 )
  )
  ( :goal
    ( and
      ( clear b899 )
    )
  )
)
