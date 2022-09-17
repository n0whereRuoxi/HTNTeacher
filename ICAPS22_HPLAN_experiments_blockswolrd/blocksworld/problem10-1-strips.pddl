( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b199 - block
    b29 - block
    b153 - block
    b19 - block
    b271 - block
    b135 - block
    b226 - block
    b288 - block
    b225 - block
    b6 - block
    b473 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b199 )
    ( on b29 b199 )
    ( on b153 b29 )
    ( on b19 b153 )
    ( on b271 b19 )
    ( on b135 b271 )
    ( on b226 b135 )
    ( on b288 b226 )
    ( on b225 b288 )
    ( on b6 b225 )
    ( on b473 b6 )
    ( clear b473 )
  )
  ( :goal
    ( and
      ( clear b199 )
    )
  )
)
