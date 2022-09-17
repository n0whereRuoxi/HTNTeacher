( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b559 - block
    b797 - block
    b429 - block
    b764 - block
    b616 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b559 )
    ( on b797 b559 )
    ( on b429 b797 )
    ( on b764 b429 )
    ( on b616 b764 )
    ( clear b616 )
  )
  ( :goal
    ( and
      ( clear b559 )
    )
  )
)
