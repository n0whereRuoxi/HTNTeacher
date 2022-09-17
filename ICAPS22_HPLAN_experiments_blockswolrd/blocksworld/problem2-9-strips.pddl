( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b772 - block
    b787 - block
    b227 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b787 b772 )
    ( on b227 b787 )
    ( clear b227 )
  )
  ( :goal
    ( and
      ( clear b772 )
    )
  )
)
