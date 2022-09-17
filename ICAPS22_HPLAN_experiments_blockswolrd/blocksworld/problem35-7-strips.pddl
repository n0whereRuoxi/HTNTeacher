( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b780 - block
    b522 - block
    b343 - block
    b323 - block
    b467 - block
    b683 - block
    b387 - block
    b530 - block
    b636 - block
    b361 - block
    b357 - block
    b819 - block
    b662 - block
    b867 - block
    b908 - block
    b706 - block
    b776 - block
    b331 - block
    b153 - block
    b841 - block
    b362 - block
    b274 - block
    b502 - block
    b772 - block
    b26 - block
    b518 - block
    b693 - block
    b624 - block
    b717 - block
    b410 - block
    b688 - block
    b395 - block
    b456 - block
    b940 - block
    b52 - block
    b594 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b780 )
    ( on b522 b780 )
    ( on b343 b522 )
    ( on b323 b343 )
    ( on b467 b323 )
    ( on b683 b467 )
    ( on b387 b683 )
    ( on b530 b387 )
    ( on b636 b530 )
    ( on b361 b636 )
    ( on b357 b361 )
    ( on b819 b357 )
    ( on b662 b819 )
    ( on b867 b662 )
    ( on b908 b867 )
    ( on b706 b908 )
    ( on b776 b706 )
    ( on b331 b776 )
    ( on b153 b331 )
    ( on b841 b153 )
    ( on b362 b841 )
    ( on b274 b362 )
    ( on b502 b274 )
    ( on b772 b502 )
    ( on b26 b772 )
    ( on b518 b26 )
    ( on b693 b518 )
    ( on b624 b693 )
    ( on b717 b624 )
    ( on b410 b717 )
    ( on b688 b410 )
    ( on b395 b688 )
    ( on b456 b395 )
    ( on b940 b456 )
    ( on b52 b940 )
    ( on b594 b52 )
    ( clear b594 )
  )
  ( :goal
    ( and
      ( clear b780 )
    )
  )
)
