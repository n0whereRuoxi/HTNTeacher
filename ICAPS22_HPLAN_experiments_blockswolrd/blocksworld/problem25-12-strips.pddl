( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b180 - block
    b89 - block
    b712 - block
    b298 - block
    b619 - block
    b687 - block
    b209 - block
    b27 - block
    b860 - block
    b305 - block
    b476 - block
    b753 - block
    b340 - block
    b416 - block
    b534 - block
    b86 - block
    b164 - block
    b72 - block
    b747 - block
    b871 - block
    b510 - block
    b745 - block
    b525 - block
    b617 - block
    b891 - block
    b408 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b180 )
    ( on b89 b180 )
    ( on b712 b89 )
    ( on b298 b712 )
    ( on b619 b298 )
    ( on b687 b619 )
    ( on b209 b687 )
    ( on b27 b209 )
    ( on b860 b27 )
    ( on b305 b860 )
    ( on b476 b305 )
    ( on b753 b476 )
    ( on b340 b753 )
    ( on b416 b340 )
    ( on b534 b416 )
    ( on b86 b534 )
    ( on b164 b86 )
    ( on b72 b164 )
    ( on b747 b72 )
    ( on b871 b747 )
    ( on b510 b871 )
    ( on b745 b510 )
    ( on b525 b745 )
    ( on b617 b525 )
    ( on b891 b617 )
    ( on b408 b891 )
    ( clear b408 )
  )
  ( :goal
    ( and
      ( clear b180 )
    )
  )
)
