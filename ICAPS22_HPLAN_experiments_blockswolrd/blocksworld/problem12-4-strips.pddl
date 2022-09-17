( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b543 - block
    b767 - block
    b606 - block
    b128 - block
    b235 - block
    b860 - block
    b32 - block
    b189 - block
    b358 - block
    b2 - block
    b669 - block
    b413 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b543 )
    ( on b767 b543 )
    ( on b606 b767 )
    ( on b128 b606 )
    ( on b235 b128 )
    ( on b860 b235 )
    ( on b32 b860 )
    ( on b189 b32 )
    ( on b358 b189 )
    ( on b2 b358 )
    ( on b669 b2 )
    ( on b413 b669 )
    ( on b366 b413 )
    ( clear b366 )
  )
  ( :goal
    ( and
      ( clear b543 )
    )
  )
)
