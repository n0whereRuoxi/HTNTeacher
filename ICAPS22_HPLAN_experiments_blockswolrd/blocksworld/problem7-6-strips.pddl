( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b57 - block
    b334 - block
    b944 - block
    b602 - block
    b757 - block
    b942 - block
    b106 - block
    b536 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b57 )
    ( on b334 b57 )
    ( on b944 b334 )
    ( on b602 b944 )
    ( on b757 b602 )
    ( on b942 b757 )
    ( on b106 b942 )
    ( on b536 b106 )
    ( clear b536 )
  )
  ( :goal
    ( and
      ( clear b57 )
    )
  )
)
