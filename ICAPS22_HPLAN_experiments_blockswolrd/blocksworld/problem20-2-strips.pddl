( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b435 - block
    b317 - block
    b240 - block
    b198 - block
    b220 - block
    b130 - block
    b908 - block
    b497 - block
    b822 - block
    b434 - block
    b544 - block
    b876 - block
    b137 - block
    b134 - block
    b441 - block
    b223 - block
    b905 - block
    b518 - block
    b146 - block
    b189 - block
    b572 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b435 )
    ( on b317 b435 )
    ( on b240 b317 )
    ( on b198 b240 )
    ( on b220 b198 )
    ( on b130 b220 )
    ( on b908 b130 )
    ( on b497 b908 )
    ( on b822 b497 )
    ( on b434 b822 )
    ( on b544 b434 )
    ( on b876 b544 )
    ( on b137 b876 )
    ( on b134 b137 )
    ( on b441 b134 )
    ( on b223 b441 )
    ( on b905 b223 )
    ( on b518 b905 )
    ( on b146 b518 )
    ( on b189 b146 )
    ( on b572 b189 )
    ( clear b572 )
  )
  ( :goal
    ( and
      ( clear b435 )
    )
  )
)
