( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b738 - block
    b217 - block
    b405 - block
    b255 - block
    b818 - block
    b992 - block
    b311 - block
    b72 - block
    b194 - block
    b327 - block
    b672 - block
    b387 - block
    b351 - block
    b959 - block
    b871 - block
    b135 - block
    b474 - block
    b713 - block
    b323 - block
    b779 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b738 )
    ( on b217 b738 )
    ( on b405 b217 )
    ( on b255 b405 )
    ( on b818 b255 )
    ( on b992 b818 )
    ( on b311 b992 )
    ( on b72 b311 )
    ( on b194 b72 )
    ( on b327 b194 )
    ( on b672 b327 )
    ( on b387 b672 )
    ( on b351 b387 )
    ( on b959 b351 )
    ( on b871 b959 )
    ( on b135 b871 )
    ( on b474 b135 )
    ( on b713 b474 )
    ( on b323 b713 )
    ( on b779 b323 )
    ( clear b779 )
  )
  ( :goal
    ( and
      ( clear b738 )
    )
  )
)
