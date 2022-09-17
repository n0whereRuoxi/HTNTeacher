( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b771 - block
    b176 - block
    b720 - block
    b885 - block
    b985 - block
    b112 - block
    b809 - block
    b289 - block
    b660 - block
    b603 - block
    b542 - block
    b415 - block
    b347 - block
    b939 - block
    b390 - block
    b138 - block
    b980 - block
    b211 - block
    b185 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b771 )
    ( on b176 b771 )
    ( on b720 b176 )
    ( on b885 b720 )
    ( on b985 b885 )
    ( on b112 b985 )
    ( on b809 b112 )
    ( on b289 b809 )
    ( on b660 b289 )
    ( on b603 b660 )
    ( on b542 b603 )
    ( on b415 b542 )
    ( on b347 b415 )
    ( on b939 b347 )
    ( on b390 b939 )
    ( on b138 b390 )
    ( on b980 b138 )
    ( on b211 b980 )
    ( on b185 b211 )
    ( clear b185 )
  )
  ( :goal
    ( and
      ( clear b771 )
    )
  )
)
