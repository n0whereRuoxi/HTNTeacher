( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b977 - block
    b677 - block
    b33 - block
    b930 - block
    b580 - block
    b816 - block
    b446 - block
    b949 - block
    b357 - block
    b255 - block
    b248 - block
    b218 - block
    b65 - block
    b541 - block
    b17 - block
    b158 - block
    b438 - block
    b442 - block
    b209 - block
    b150 - block
    b184 - block
    b377 - block
    b311 - block
    b64 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b977 )
    ( on b677 b977 )
    ( on b33 b677 )
    ( on b930 b33 )
    ( on b580 b930 )
    ( on b816 b580 )
    ( on b446 b816 )
    ( on b949 b446 )
    ( on b357 b949 )
    ( on b255 b357 )
    ( on b248 b255 )
    ( on b218 b248 )
    ( on b65 b218 )
    ( on b541 b65 )
    ( on b17 b541 )
    ( on b158 b17 )
    ( on b438 b158 )
    ( on b442 b438 )
    ( on b209 b442 )
    ( on b150 b209 )
    ( on b184 b150 )
    ( on b377 b184 )
    ( on b311 b377 )
    ( on b64 b311 )
    ( clear b64 )
  )
  ( :goal
    ( and
      ( clear b977 )
    )
  )
)
