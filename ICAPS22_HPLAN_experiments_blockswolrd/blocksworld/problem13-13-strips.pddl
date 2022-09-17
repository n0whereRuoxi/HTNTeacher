( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b216 - block
    b339 - block
    b277 - block
    b732 - block
    b305 - block
    b324 - block
    b307 - block
    b819 - block
    b585 - block
    b419 - block
    b110 - block
    b48 - block
    b459 - block
    b483 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b216 )
    ( on b339 b216 )
    ( on b277 b339 )
    ( on b732 b277 )
    ( on b305 b732 )
    ( on b324 b305 )
    ( on b307 b324 )
    ( on b819 b307 )
    ( on b585 b819 )
    ( on b419 b585 )
    ( on b110 b419 )
    ( on b48 b110 )
    ( on b459 b48 )
    ( on b483 b459 )
    ( clear b483 )
  )
  ( :goal
    ( and
      ( clear b216 )
    )
  )
)
