( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b732 - block
    b719 - block
    b180 - block
    b532 - block
    b152 - block
    b165 - block
    b860 - block
    b717 - block
    b241 - block
    b747 - block
    b238 - block
    b981 - block
    b530 - block
    b774 - block
    b398 - block
    b536 - block
    b43 - block
    b831 - block
    b740 - block
    b266 - block
    b280 - block
    b42 - block
    b511 - block
    b758 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b732 )
    ( on b719 b732 )
    ( on b180 b719 )
    ( on b532 b180 )
    ( on b152 b532 )
    ( on b165 b152 )
    ( on b860 b165 )
    ( on b717 b860 )
    ( on b241 b717 )
    ( on b747 b241 )
    ( on b238 b747 )
    ( on b981 b238 )
    ( on b530 b981 )
    ( on b774 b530 )
    ( on b398 b774 )
    ( on b536 b398 )
    ( on b43 b536 )
    ( on b831 b43 )
    ( on b740 b831 )
    ( on b266 b740 )
    ( on b280 b266 )
    ( on b42 b280 )
    ( on b511 b42 )
    ( on b758 b511 )
    ( clear b758 )
  )
  ( :goal
    ( and
      ( clear b732 )
    )
  )
)
