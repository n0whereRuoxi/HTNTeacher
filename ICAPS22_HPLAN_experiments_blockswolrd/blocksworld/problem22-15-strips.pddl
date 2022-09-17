( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b114 - block
    b71 - block
    b749 - block
    b790 - block
    b49 - block
    b732 - block
    b445 - block
    b557 - block
    b274 - block
    b815 - block
    b644 - block
    b328 - block
    b673 - block
    b481 - block
    b446 - block
    b921 - block
    b484 - block
    b690 - block
    b933 - block
    b876 - block
    b814 - block
    b797 - block
    b729 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b114 )
    ( on b71 b114 )
    ( on b749 b71 )
    ( on b790 b749 )
    ( on b49 b790 )
    ( on b732 b49 )
    ( on b445 b732 )
    ( on b557 b445 )
    ( on b274 b557 )
    ( on b815 b274 )
    ( on b644 b815 )
    ( on b328 b644 )
    ( on b673 b328 )
    ( on b481 b673 )
    ( on b446 b481 )
    ( on b921 b446 )
    ( on b484 b921 )
    ( on b690 b484 )
    ( on b933 b690 )
    ( on b876 b933 )
    ( on b814 b876 )
    ( on b797 b814 )
    ( on b729 b797 )
    ( clear b729 )
  )
  ( :goal
    ( and
      ( clear b114 )
    )
  )
)
