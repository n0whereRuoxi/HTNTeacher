( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b408 - block
    b298 - block
    b656 - block
    b662 - block
    b820 - block
    b676 - block
    b875 - block
    b22 - block
    b64 - block
    b269 - block
    b886 - block
    b96 - block
    b268 - block
    b131 - block
    b604 - block
    b453 - block
    b12 - block
    b322 - block
    b499 - block
    b194 - block
    b593 - block
    b78 - block
    b142 - block
    b562 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b408 )
    ( on b298 b408 )
    ( on b656 b298 )
    ( on b662 b656 )
    ( on b820 b662 )
    ( on b676 b820 )
    ( on b875 b676 )
    ( on b22 b875 )
    ( on b64 b22 )
    ( on b269 b64 )
    ( on b886 b269 )
    ( on b96 b886 )
    ( on b268 b96 )
    ( on b131 b268 )
    ( on b604 b131 )
    ( on b453 b604 )
    ( on b12 b453 )
    ( on b322 b12 )
    ( on b499 b322 )
    ( on b194 b499 )
    ( on b593 b194 )
    ( on b78 b593 )
    ( on b142 b78 )
    ( on b562 b142 )
    ( clear b562 )
  )
  ( :goal
    ( and
      ( clear b408 )
    )
  )
)
