( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b24 - block
    b225 - block
    b539 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b24 )
    ( on b225 b24 )
    ( on b539 b225 )
    ( clear b539 )
  )
  ( :goal
    ( and
      ( clear b24 )
    )
  )
)
