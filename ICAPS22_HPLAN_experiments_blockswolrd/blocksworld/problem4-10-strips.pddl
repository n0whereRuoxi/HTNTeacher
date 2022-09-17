( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b312 - block
    b307 - block
    b380 - block
    b812 - block
    b536 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b312 )
    ( on b307 b312 )
    ( on b380 b307 )
    ( on b812 b380 )
    ( on b536 b812 )
    ( clear b536 )
  )
  ( :goal
    ( and
      ( clear b312 )
    )
  )
)
