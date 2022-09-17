( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b874 - block
    b629 - block
    b995 - block
    b692 - block
    b126 - block
    b447 - block
    b302 - block
    b7 - block
    b405 - block
    b107 - block
    b951 - block
    b780 - block
    b558 - block
    b739 - block
    b597 - block
    b936 - block
    b88 - block
    b440 - block
    b987 - block
    b871 - block
    b726 - block
    b243 - block
    b443 - block
    b100 - block
    b89 - block
    b695 - block
    b860 - block
    b205 - block
    b34 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b874 )
    ( on b629 b874 )
    ( on b995 b629 )
    ( on b692 b995 )
    ( on b126 b692 )
    ( on b447 b126 )
    ( on b302 b447 )
    ( on b7 b302 )
    ( on b405 b7 )
    ( on b107 b405 )
    ( on b951 b107 )
    ( on b780 b951 )
    ( on b558 b780 )
    ( on b739 b558 )
    ( on b597 b739 )
    ( on b936 b597 )
    ( on b88 b936 )
    ( on b440 b88 )
    ( on b987 b440 )
    ( on b871 b987 )
    ( on b726 b871 )
    ( on b243 b726 )
    ( on b443 b243 )
    ( on b100 b443 )
    ( on b89 b100 )
    ( on b695 b89 )
    ( on b860 b695 )
    ( on b205 b860 )
    ( on b34 b205 )
    ( clear b34 )
  )
  ( :goal
    ( and
      ( clear b874 )
    )
  )
)
