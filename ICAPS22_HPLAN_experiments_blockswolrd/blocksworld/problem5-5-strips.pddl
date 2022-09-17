( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b68 - block
    b90 - block
    b706 - block
    b767 - block
    b739 - block
    b972 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b68 )
    ( on b90 b68 )
    ( on b706 b90 )
    ( on b767 b706 )
    ( on b739 b767 )
    ( on b972 b739 )
    ( clear b972 )
  )
  ( :goal
    ( and
      ( clear b68 )
    )
  )
)
