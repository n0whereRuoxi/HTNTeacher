( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b483 - block
    b576 - block
    b937 - block
    b83 - block
    b965 - block
    b582 - block
    b509 - block
    b600 - block
    b757 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b483 )
    ( on b576 b483 )
    ( on b937 b576 )
    ( on b83 b937 )
    ( on b965 b83 )
    ( on b582 b965 )
    ( on b509 b582 )
    ( on b600 b509 )
    ( on b757 b600 )
    ( clear b757 )
  )
  ( :goal
    ( and
      ( clear b483 )
    )
  )
)
