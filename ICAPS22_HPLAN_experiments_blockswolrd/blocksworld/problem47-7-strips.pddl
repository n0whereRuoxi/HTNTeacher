( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b501 - block
    b944 - block
    b436 - block
    b437 - block
    b978 - block
    b650 - block
    b921 - block
    b111 - block
    b61 - block
    b68 - block
    b844 - block
    b970 - block
    b201 - block
    b63 - block
    b878 - block
    b251 - block
    b317 - block
    b106 - block
    b143 - block
    b351 - block
    b258 - block
    b684 - block
    b945 - block
    b876 - block
    b705 - block
    b912 - block
    b205 - block
    b992 - block
    b754 - block
    b714 - block
    b549 - block
    b993 - block
    b781 - block
    b490 - block
    b856 - block
    b208 - block
    b617 - block
    b224 - block
    b863 - block
    b326 - block
    b441 - block
    b229 - block
    b34 - block
    b932 - block
    b419 - block
    b124 - block
    b908 - block
    b127 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b501 )
    ( on b944 b501 )
    ( on b436 b944 )
    ( on b437 b436 )
    ( on b978 b437 )
    ( on b650 b978 )
    ( on b921 b650 )
    ( on b111 b921 )
    ( on b61 b111 )
    ( on b68 b61 )
    ( on b844 b68 )
    ( on b970 b844 )
    ( on b201 b970 )
    ( on b63 b201 )
    ( on b878 b63 )
    ( on b251 b878 )
    ( on b317 b251 )
    ( on b106 b317 )
    ( on b143 b106 )
    ( on b351 b143 )
    ( on b258 b351 )
    ( on b684 b258 )
    ( on b945 b684 )
    ( on b876 b945 )
    ( on b705 b876 )
    ( on b912 b705 )
    ( on b205 b912 )
    ( on b992 b205 )
    ( on b754 b992 )
    ( on b714 b754 )
    ( on b549 b714 )
    ( on b993 b549 )
    ( on b781 b993 )
    ( on b490 b781 )
    ( on b856 b490 )
    ( on b208 b856 )
    ( on b617 b208 )
    ( on b224 b617 )
    ( on b863 b224 )
    ( on b326 b863 )
    ( on b441 b326 )
    ( on b229 b441 )
    ( on b34 b229 )
    ( on b932 b34 )
    ( on b419 b932 )
    ( on b124 b419 )
    ( on b908 b124 )
    ( on b127 b908 )
    ( clear b127 )
  )
  ( :goal
    ( and
      ( clear b501 )
    )
  )
)
