( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b221 - block
    b174 - block
    b274 - block
    b39 - block
    b831 - block
    b425 - block
    b396 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b174 b221 )
    ( on b274 b174 )
    ( on b39 b274 )
    ( on b831 b39 )
    ( on b425 b831 )
    ( on b396 b425 )
    ( clear b396 )
  )
  ( :goal
    ( and
      ( clear b221 )
    )
  )
)
