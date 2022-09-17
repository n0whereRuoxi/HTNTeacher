( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b302 - block
    b765 - block
    b516 - block
    b197 - block
    b75 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b302 )
    ( on b765 b302 )
    ( on b516 b765 )
    ( on b197 b516 )
    ( on b75 b197 )
    ( clear b75 )
  )
  ( :goal
    ( and
      ( clear b302 )
    )
  )
)
