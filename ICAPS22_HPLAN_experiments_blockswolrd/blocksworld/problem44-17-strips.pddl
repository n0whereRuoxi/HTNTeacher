( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b532 - block
    b726 - block
    b94 - block
    b987 - block
    b58 - block
    b310 - block
    b393 - block
    b700 - block
    b959 - block
    b239 - block
    b721 - block
    b834 - block
    b129 - block
    b807 - block
    b442 - block
    b697 - block
    b787 - block
    b20 - block
    b956 - block
    b83 - block
    b599 - block
    b757 - block
    b602 - block
    b844 - block
    b420 - block
    b26 - block
    b949 - block
    b245 - block
    b751 - block
    b109 - block
    b309 - block
    b233 - block
    b452 - block
    b208 - block
    b957 - block
    b305 - block
    b918 - block
    b897 - block
    b713 - block
    b593 - block
    b919 - block
    b586 - block
    b282 - block
    b503 - block
    b67 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b532 )
    ( on b726 b532 )
    ( on b94 b726 )
    ( on b987 b94 )
    ( on b58 b987 )
    ( on b310 b58 )
    ( on b393 b310 )
    ( on b700 b393 )
    ( on b959 b700 )
    ( on b239 b959 )
    ( on b721 b239 )
    ( on b834 b721 )
    ( on b129 b834 )
    ( on b807 b129 )
    ( on b442 b807 )
    ( on b697 b442 )
    ( on b787 b697 )
    ( on b20 b787 )
    ( on b956 b20 )
    ( on b83 b956 )
    ( on b599 b83 )
    ( on b757 b599 )
    ( on b602 b757 )
    ( on b844 b602 )
    ( on b420 b844 )
    ( on b26 b420 )
    ( on b949 b26 )
    ( on b245 b949 )
    ( on b751 b245 )
    ( on b109 b751 )
    ( on b309 b109 )
    ( on b233 b309 )
    ( on b452 b233 )
    ( on b208 b452 )
    ( on b957 b208 )
    ( on b305 b957 )
    ( on b918 b305 )
    ( on b897 b918 )
    ( on b713 b897 )
    ( on b593 b713 )
    ( on b919 b593 )
    ( on b586 b919 )
    ( on b282 b586 )
    ( on b503 b282 )
    ( on b67 b503 )
    ( clear b67 )
  )
  ( :goal
    ( and
      ( clear b532 )
    )
  )
)
