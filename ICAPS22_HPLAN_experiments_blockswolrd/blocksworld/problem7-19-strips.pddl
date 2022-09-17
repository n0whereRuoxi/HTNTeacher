( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b965 - block
    b61 - block
    b84 - block
    b125 - block
    b721 - block
    b475 - block
    b898 - block
    b208 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b965 )
    ( on b61 b965 )
    ( on b84 b61 )
    ( on b125 b84 )
    ( on b721 b125 )
    ( on b475 b721 )
    ( on b898 b475 )
    ( on b208 b898 )
    ( clear b208 )
  )
  ( :goal
    ( and
      ( clear b965 )
    )
  )
)
