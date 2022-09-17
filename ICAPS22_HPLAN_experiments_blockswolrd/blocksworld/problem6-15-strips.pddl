( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b796 - block
    b644 - block
    b407 - block
    b358 - block
    b269 - block
    b107 - block
    b454 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b796 )
    ( on b644 b796 )
    ( on b407 b644 )
    ( on b358 b407 )
    ( on b269 b358 )
    ( on b107 b269 )
    ( on b454 b107 )
    ( clear b454 )
  )
  ( :goal
    ( and
      ( clear b796 )
    )
  )
)
