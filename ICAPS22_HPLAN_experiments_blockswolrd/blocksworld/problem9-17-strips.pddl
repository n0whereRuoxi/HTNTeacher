( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b351 - block
    b289 - block
    b425 - block
    b898 - block
    b870 - block
    b992 - block
    b42 - block
    b808 - block
    b972 - block
    b774 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b351 )
    ( on b289 b351 )
    ( on b425 b289 )
    ( on b898 b425 )
    ( on b870 b898 )
    ( on b992 b870 )
    ( on b42 b992 )
    ( on b808 b42 )
    ( on b972 b808 )
    ( on b774 b972 )
    ( clear b774 )
  )
  ( :goal
    ( and
      ( clear b351 )
    )
  )
)
