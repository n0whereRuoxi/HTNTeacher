( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b932 - block
    b127 - block
    b401 - block
    b113 - block
    b460 - block
    b554 - block
    b923 - block
    b503 - block
    b576 - block
    b440 - block
    b375 - block
    b154 - block
    b450 - block
    b219 - block
    b71 - block
    b577 - block
    b828 - block
    b555 - block
    b912 - block
    b711 - block
    b812 - block
    b284 - block
    b846 - block
    b854 - block
    b970 - block
    b467 - block
    b730 - block
    b190 - block
    b481 - block
    b62 - block
    b74 - block
    b901 - block
    b124 - block
    b7 - block
    b43 - block
    b9 - block
    b84 - block
    b638 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b932 )
    ( on b127 b932 )
    ( on b401 b127 )
    ( on b113 b401 )
    ( on b460 b113 )
    ( on b554 b460 )
    ( on b923 b554 )
    ( on b503 b923 )
    ( on b576 b503 )
    ( on b440 b576 )
    ( on b375 b440 )
    ( on b154 b375 )
    ( on b450 b154 )
    ( on b219 b450 )
    ( on b71 b219 )
    ( on b577 b71 )
    ( on b828 b577 )
    ( on b555 b828 )
    ( on b912 b555 )
    ( on b711 b912 )
    ( on b812 b711 )
    ( on b284 b812 )
    ( on b846 b284 )
    ( on b854 b846 )
    ( on b970 b854 )
    ( on b467 b970 )
    ( on b730 b467 )
    ( on b190 b730 )
    ( on b481 b190 )
    ( on b62 b481 )
    ( on b74 b62 )
    ( on b901 b74 )
    ( on b124 b901 )
    ( on b7 b124 )
    ( on b43 b7 )
    ( on b9 b43 )
    ( on b84 b9 )
    ( on b638 b84 )
    ( clear b638 )
  )
  ( :goal
    ( and
      ( clear b932 )
    )
  )
)
