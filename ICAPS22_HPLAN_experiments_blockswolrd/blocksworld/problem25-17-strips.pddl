( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b607 - block
    b353 - block
    b429 - block
    b307 - block
    b396 - block
    b934 - block
    b134 - block
    b477 - block
    b866 - block
    b499 - block
    b937 - block
    b61 - block
    b550 - block
    b64 - block
    b40 - block
    b152 - block
    b697 - block
    b334 - block
    b97 - block
    b114 - block
    b815 - block
    b260 - block
    b176 - block
    b599 - block
    b368 - block
    b43 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b607 )
    ( on b353 b607 )
    ( on b429 b353 )
    ( on b307 b429 )
    ( on b396 b307 )
    ( on b934 b396 )
    ( on b134 b934 )
    ( on b477 b134 )
    ( on b866 b477 )
    ( on b499 b866 )
    ( on b937 b499 )
    ( on b61 b937 )
    ( on b550 b61 )
    ( on b64 b550 )
    ( on b40 b64 )
    ( on b152 b40 )
    ( on b697 b152 )
    ( on b334 b697 )
    ( on b97 b334 )
    ( on b114 b97 )
    ( on b815 b114 )
    ( on b260 b815 )
    ( on b176 b260 )
    ( on b599 b176 )
    ( on b368 b599 )
    ( on b43 b368 )
    ( clear b43 )
  )
  ( :goal
    ( and
      ( clear b607 )
    )
  )
)
