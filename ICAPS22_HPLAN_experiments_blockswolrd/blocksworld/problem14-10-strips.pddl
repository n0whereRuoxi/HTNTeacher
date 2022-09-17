( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b202 - block
    b587 - block
    b846 - block
    b376 - block
    b582 - block
    b788 - block
    b159 - block
    b549 - block
    b473 - block
    b269 - block
    b963 - block
    b344 - block
    b906 - block
    b884 - block
    b659 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b202 )
    ( on b587 b202 )
    ( on b846 b587 )
    ( on b376 b846 )
    ( on b582 b376 )
    ( on b788 b582 )
    ( on b159 b788 )
    ( on b549 b159 )
    ( on b473 b549 )
    ( on b269 b473 )
    ( on b963 b269 )
    ( on b344 b963 )
    ( on b906 b344 )
    ( on b884 b906 )
    ( on b659 b884 )
    ( clear b659 )
  )
  ( :goal
    ( and
      ( clear b202 )
    )
  )
)
