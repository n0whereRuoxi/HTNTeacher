( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b714 - block
    b91 - block
    b114 - block
    b930 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b714 )
    ( on b91 b714 )
    ( on b114 b91 )
    ( on b930 b114 )
    ( clear b930 )
  )
  ( :goal
    ( and
      ( clear b714 )
    )
  )
)
