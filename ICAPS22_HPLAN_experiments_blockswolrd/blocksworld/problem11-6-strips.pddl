( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b258 - block
    b233 - block
    b665 - block
    b624 - block
    b662 - block
    b142 - block
    b659 - block
    b834 - block
    b804 - block
    b222 - block
    b875 - block
    b571 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b258 )
    ( on b233 b258 )
    ( on b665 b233 )
    ( on b624 b665 )
    ( on b662 b624 )
    ( on b142 b662 )
    ( on b659 b142 )
    ( on b834 b659 )
    ( on b804 b834 )
    ( on b222 b804 )
    ( on b875 b222 )
    ( on b571 b875 )
    ( clear b571 )
  )
  ( :goal
    ( and
      ( clear b258 )
    )
  )
)
