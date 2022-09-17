( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b354 - block
    b461 - block
    b840 - block
    b980 - block
    b44 - block
    b417 - block
    b690 - block
    b719 - block
    b301 - block
    b272 - block
    b336 - block
    b453 - block
    b829 - block
    b388 - block
    b339 - block
    b166 - block
    b276 - block
    b190 - block
    b201 - block
    b346 - block
    b33 - block
    b147 - block
    b665 - block
    b855 - block
    b664 - block
    b438 - block
    b427 - block
    b480 - block
    b928 - block
    b63 - block
    b360 - block
    b144 - block
    b98 - block
    b531 - block
    b998 - block
    b881 - block
    b287 - block
    b833 - block
    b471 - block
    b523 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b354 )
    ( on b461 b354 )
    ( on b840 b461 )
    ( on b980 b840 )
    ( on b44 b980 )
    ( on b417 b44 )
    ( on b690 b417 )
    ( on b719 b690 )
    ( on b301 b719 )
    ( on b272 b301 )
    ( on b336 b272 )
    ( on b453 b336 )
    ( on b829 b453 )
    ( on b388 b829 )
    ( on b339 b388 )
    ( on b166 b339 )
    ( on b276 b166 )
    ( on b190 b276 )
    ( on b201 b190 )
    ( on b346 b201 )
    ( on b33 b346 )
    ( on b147 b33 )
    ( on b665 b147 )
    ( on b855 b665 )
    ( on b664 b855 )
    ( on b438 b664 )
    ( on b427 b438 )
    ( on b480 b427 )
    ( on b928 b480 )
    ( on b63 b928 )
    ( on b360 b63 )
    ( on b144 b360 )
    ( on b98 b144 )
    ( on b531 b98 )
    ( on b998 b531 )
    ( on b881 b998 )
    ( on b287 b881 )
    ( on b833 b287 )
    ( on b471 b833 )
    ( on b523 b471 )
    ( clear b523 )
  )
  ( :goal
    ( and
      ( clear b354 )
    )
  )
)
