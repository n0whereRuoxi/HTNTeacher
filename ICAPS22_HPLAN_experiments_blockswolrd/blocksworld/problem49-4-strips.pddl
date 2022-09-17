( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b925 - block
    b472 - block
    b968 - block
    b246 - block
    b807 - block
    b318 - block
    b646 - block
    b311 - block
    b596 - block
    b170 - block
    b644 - block
    b757 - block
    b949 - block
    b463 - block
    b627 - block
    b193 - block
    b15 - block
    b59 - block
    b276 - block
    b85 - block
    b501 - block
    b564 - block
    b496 - block
    b851 - block
    b285 - block
    b61 - block
    b486 - block
    b891 - block
    b360 - block
    b518 - block
    b861 - block
    b605 - block
    b672 - block
    b272 - block
    b586 - block
    b82 - block
    b998 - block
    b266 - block
    b434 - block
    b13 - block
    b322 - block
    b347 - block
    b355 - block
    b630 - block
    b423 - block
    b317 - block
    b735 - block
    b100 - block
    b560 - block
    b203 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b925 )
    ( on b472 b925 )
    ( on b968 b472 )
    ( on b246 b968 )
    ( on b807 b246 )
    ( on b318 b807 )
    ( on b646 b318 )
    ( on b311 b646 )
    ( on b596 b311 )
    ( on b170 b596 )
    ( on b644 b170 )
    ( on b757 b644 )
    ( on b949 b757 )
    ( on b463 b949 )
    ( on b627 b463 )
    ( on b193 b627 )
    ( on b15 b193 )
    ( on b59 b15 )
    ( on b276 b59 )
    ( on b85 b276 )
    ( on b501 b85 )
    ( on b564 b501 )
    ( on b496 b564 )
    ( on b851 b496 )
    ( on b285 b851 )
    ( on b61 b285 )
    ( on b486 b61 )
    ( on b891 b486 )
    ( on b360 b891 )
    ( on b518 b360 )
    ( on b861 b518 )
    ( on b605 b861 )
    ( on b672 b605 )
    ( on b272 b672 )
    ( on b586 b272 )
    ( on b82 b586 )
    ( on b998 b82 )
    ( on b266 b998 )
    ( on b434 b266 )
    ( on b13 b434 )
    ( on b322 b13 )
    ( on b347 b322 )
    ( on b355 b347 )
    ( on b630 b355 )
    ( on b423 b630 )
    ( on b317 b423 )
    ( on b735 b317 )
    ( on b100 b735 )
    ( on b560 b100 )
    ( on b203 b560 )
    ( clear b203 )
  )
  ( :goal
    ( and
      ( clear b925 )
    )
  )
)
