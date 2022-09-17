( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b695 - block
    b296 - block
    b965 - block
    b680 - block
    b559 - block
    b769 - block
    b218 - block
    b340 - block
    b121 - block
    b13 - block
    b929 - block
    b779 - block
    b749 - block
    b200 - block
    b329 - block
    b905 - block
    b713 - block
    b809 - block
    b505 - block
    b367 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b695 )
    ( on b296 b695 )
    ( on b965 b296 )
    ( on b680 b965 )
    ( on b559 b680 )
    ( on b769 b559 )
    ( on b218 b769 )
    ( on b340 b218 )
    ( on b121 b340 )
    ( on b13 b121 )
    ( on b929 b13 )
    ( on b779 b929 )
    ( on b749 b779 )
    ( on b200 b749 )
    ( on b329 b200 )
    ( on b905 b329 )
    ( on b713 b905 )
    ( on b809 b713 )
    ( on b505 b809 )
    ( on b367 b505 )
    ( clear b367 )
  )
  ( :goal
    ( and
      ( clear b695 )
    )
  )
)
