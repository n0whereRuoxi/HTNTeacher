( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b608 - block
    b529 - block
    b523 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b608 )
    ( on b529 b608 )
    ( on b523 b529 )
    ( clear b523 )
  )
  ( :goal
    ( and
      ( clear b608 )
    )
  )
)
