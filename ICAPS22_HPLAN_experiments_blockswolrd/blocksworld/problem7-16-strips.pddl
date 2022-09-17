( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b51 - block
    b569 - block
    b64 - block
    b440 - block
    b992 - block
    b820 - block
    b104 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b51 )
    ( on b569 b51 )
    ( on b64 b569 )
    ( on b440 b64 )
    ( on b992 b440 )
    ( on b820 b992 )
    ( on b104 b820 )
    ( on b946 b104 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b51 )
    )
  )
)
