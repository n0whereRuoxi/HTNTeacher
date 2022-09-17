( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b890 - block
    b930 - block
    b691 - block
    b418 - block
    b78 - block
    b500 - block
    b728 - block
    b799 - block
    b99 - block
    b929 - block
    b376 - block
    b575 - block
    b725 - block
    b744 - block
    b237 - block
    b115 - block
    b610 - block
    b354 - block
    b79 - block
    b919 - block
    b453 - block
    b947 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b890 )
    ( on b930 b890 )
    ( on b691 b930 )
    ( on b418 b691 )
    ( on b78 b418 )
    ( on b500 b78 )
    ( on b728 b500 )
    ( on b799 b728 )
    ( on b99 b799 )
    ( on b929 b99 )
    ( on b376 b929 )
    ( on b575 b376 )
    ( on b725 b575 )
    ( on b744 b725 )
    ( on b237 b744 )
    ( on b115 b237 )
    ( on b610 b115 )
    ( on b354 b610 )
    ( on b79 b354 )
    ( on b919 b79 )
    ( on b453 b919 )
    ( on b947 b453 )
    ( clear b947 )
  )
  ( :goal
    ( and
      ( clear b890 )
    )
  )
)
