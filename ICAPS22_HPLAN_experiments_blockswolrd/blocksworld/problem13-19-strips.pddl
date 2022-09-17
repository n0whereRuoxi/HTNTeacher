( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b241 - block
    b426 - block
    b755 - block
    b602 - block
    b957 - block
    b255 - block
    b552 - block
    b314 - block
    b835 - block
    b918 - block
    b248 - block
    b643 - block
    b839 - block
    b168 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b241 )
    ( on b426 b241 )
    ( on b755 b426 )
    ( on b602 b755 )
    ( on b957 b602 )
    ( on b255 b957 )
    ( on b552 b255 )
    ( on b314 b552 )
    ( on b835 b314 )
    ( on b918 b835 )
    ( on b248 b918 )
    ( on b643 b248 )
    ( on b839 b643 )
    ( on b168 b839 )
    ( clear b168 )
  )
  ( :goal
    ( and
      ( clear b241 )
    )
  )
)
