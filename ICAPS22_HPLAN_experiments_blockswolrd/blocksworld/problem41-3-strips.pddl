( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b389 - block
    b509 - block
    b169 - block
    b785 - block
    b390 - block
    b537 - block
    b392 - block
    b810 - block
    b895 - block
    b340 - block
    b599 - block
    b223 - block
    b925 - block
    b749 - block
    b506 - block
    b600 - block
    b38 - block
    b818 - block
    b773 - block
    b120 - block
    b444 - block
    b923 - block
    b481 - block
    b47 - block
    b926 - block
    b180 - block
    b522 - block
    b937 - block
    b400 - block
    b739 - block
    b705 - block
    b46 - block
    b239 - block
    b996 - block
    b657 - block
    b718 - block
    b888 - block
    b732 - block
    b683 - block
    b116 - block
    b241 - block
    b53 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b389 )
    ( on b509 b389 )
    ( on b169 b509 )
    ( on b785 b169 )
    ( on b390 b785 )
    ( on b537 b390 )
    ( on b392 b537 )
    ( on b810 b392 )
    ( on b895 b810 )
    ( on b340 b895 )
    ( on b599 b340 )
    ( on b223 b599 )
    ( on b925 b223 )
    ( on b749 b925 )
    ( on b506 b749 )
    ( on b600 b506 )
    ( on b38 b600 )
    ( on b818 b38 )
    ( on b773 b818 )
    ( on b120 b773 )
    ( on b444 b120 )
    ( on b923 b444 )
    ( on b481 b923 )
    ( on b47 b481 )
    ( on b926 b47 )
    ( on b180 b926 )
    ( on b522 b180 )
    ( on b937 b522 )
    ( on b400 b937 )
    ( on b739 b400 )
    ( on b705 b739 )
    ( on b46 b705 )
    ( on b239 b46 )
    ( on b996 b239 )
    ( on b657 b996 )
    ( on b718 b657 )
    ( on b888 b718 )
    ( on b732 b888 )
    ( on b683 b732 )
    ( on b116 b683 )
    ( on b241 b116 )
    ( on b53 b241 )
    ( clear b53 )
  )
  ( :goal
    ( and
      ( clear b389 )
    )
  )
)
