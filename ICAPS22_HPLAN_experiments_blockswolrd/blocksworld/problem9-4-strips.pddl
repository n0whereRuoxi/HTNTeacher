( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b855 - block
    b376 - block
    b65 - block
    b155 - block
    b921 - block
    b52 - block
    b717 - block
    b659 - block
    b224 - block
    b676 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b855 )
    ( on b376 b855 )
    ( on b65 b376 )
    ( on b155 b65 )
    ( on b921 b155 )
    ( on b52 b921 )
    ( on b717 b52 )
    ( on b659 b717 )
    ( on b224 b659 )
    ( on b676 b224 )
    ( clear b676 )
  )
  ( :goal
    ( and
      ( clear b855 )
    )
  )
)
