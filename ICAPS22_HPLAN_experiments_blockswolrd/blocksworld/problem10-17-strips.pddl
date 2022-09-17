( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b344 - block
    b705 - block
    b647 - block
    b499 - block
    b928 - block
    b922 - block
    b100 - block
    b137 - block
    b607 - block
    b858 - block
    b557 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b344 )
    ( on b705 b344 )
    ( on b647 b705 )
    ( on b499 b647 )
    ( on b928 b499 )
    ( on b922 b928 )
    ( on b100 b922 )
    ( on b137 b100 )
    ( on b607 b137 )
    ( on b858 b607 )
    ( on b557 b858 )
    ( clear b557 )
  )
  ( :goal
    ( and
      ( clear b344 )
    )
  )
)
