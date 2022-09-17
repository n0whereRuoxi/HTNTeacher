( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b580 - block
    b560 - block
    b838 - block
    b587 - block
    b549 - block
    b873 - block
    b307 - block
    b654 - block
    b319 - block
    b59 - block
    b327 - block
    b477 - block
    b384 - block
    b74 - block
    b978 - block
    b48 - block
    b947 - block
    b627 - block
    b992 - block
    b275 - block
    b981 - block
    b357 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b580 )
    ( on b560 b580 )
    ( on b838 b560 )
    ( on b587 b838 )
    ( on b549 b587 )
    ( on b873 b549 )
    ( on b307 b873 )
    ( on b654 b307 )
    ( on b319 b654 )
    ( on b59 b319 )
    ( on b327 b59 )
    ( on b477 b327 )
    ( on b384 b477 )
    ( on b74 b384 )
    ( on b978 b74 )
    ( on b48 b978 )
    ( on b947 b48 )
    ( on b627 b947 )
    ( on b992 b627 )
    ( on b275 b992 )
    ( on b981 b275 )
    ( on b357 b981 )
    ( clear b357 )
  )
  ( :goal
    ( and
      ( clear b580 )
    )
  )
)
