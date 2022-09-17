( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b971 - block
    b683 - block
    b711 - block
    b135 - block
    b443 - block
    b525 - block
    b868 - block
    b368 - block
    b448 - block
    b250 - block
    b652 - block
    b220 - block
    b35 - block
    b82 - block
    b454 - block
    b178 - block
    b805 - block
    b438 - block
    b309 - block
    b283 - block
    b553 - block
    b301 - block
    b946 - block
    b166 - block
    b2 - block
    b325 - block
    b601 - block
    b285 - block
    b968 - block
    b440 - block
    b602 - block
    b224 - block
    b892 - block
    b536 - block
    b977 - block
    b320 - block
    b546 - block
    b755 - block
    b638 - block
    b161 - block
    b323 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b971 )
    ( on b683 b971 )
    ( on b711 b683 )
    ( on b135 b711 )
    ( on b443 b135 )
    ( on b525 b443 )
    ( on b868 b525 )
    ( on b368 b868 )
    ( on b448 b368 )
    ( on b250 b448 )
    ( on b652 b250 )
    ( on b220 b652 )
    ( on b35 b220 )
    ( on b82 b35 )
    ( on b454 b82 )
    ( on b178 b454 )
    ( on b805 b178 )
    ( on b438 b805 )
    ( on b309 b438 )
    ( on b283 b309 )
    ( on b553 b283 )
    ( on b301 b553 )
    ( on b946 b301 )
    ( on b166 b946 )
    ( on b2 b166 )
    ( on b325 b2 )
    ( on b601 b325 )
    ( on b285 b601 )
    ( on b968 b285 )
    ( on b440 b968 )
    ( on b602 b440 )
    ( on b224 b602 )
    ( on b892 b224 )
    ( on b536 b892 )
    ( on b977 b536 )
    ( on b320 b977 )
    ( on b546 b320 )
    ( on b755 b546 )
    ( on b638 b755 )
    ( on b161 b638 )
    ( on b323 b161 )
    ( clear b323 )
  )
  ( :goal
    ( and
      ( clear b971 )
    )
  )
)
