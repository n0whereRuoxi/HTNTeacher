( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b143 - block
    b893 - block
    b820 - block
    b241 - block
    b288 - block
    b555 - block
    b312 - block
    b959 - block
    b70 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b143 )
    ( on b893 b143 )
    ( on b820 b893 )
    ( on b241 b820 )
    ( on b288 b241 )
    ( on b555 b288 )
    ( on b312 b555 )
    ( on b959 b312 )
    ( on b70 b959 )
    ( clear b70 )
  )
  ( :goal
    ( and
      ( clear b143 )
    )
  )
)
