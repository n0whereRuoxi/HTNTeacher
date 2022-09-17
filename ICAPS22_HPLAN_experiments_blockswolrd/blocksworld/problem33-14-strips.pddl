( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b389 - block
    b767 - block
    b140 - block
    b153 - block
    b881 - block
    b943 - block
    b251 - block
    b222 - block
    b298 - block
    b721 - block
    b896 - block
    b972 - block
    b614 - block
    b498 - block
    b523 - block
    b953 - block
    b695 - block
    b895 - block
    b200 - block
    b267 - block
    b423 - block
    b489 - block
    b494 - block
    b713 - block
    b443 - block
    b395 - block
    b586 - block
    b532 - block
    b598 - block
    b580 - block
    b853 - block
    b399 - block
    b317 - block
    b121 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b389 )
    ( on b767 b389 )
    ( on b140 b767 )
    ( on b153 b140 )
    ( on b881 b153 )
    ( on b943 b881 )
    ( on b251 b943 )
    ( on b222 b251 )
    ( on b298 b222 )
    ( on b721 b298 )
    ( on b896 b721 )
    ( on b972 b896 )
    ( on b614 b972 )
    ( on b498 b614 )
    ( on b523 b498 )
    ( on b953 b523 )
    ( on b695 b953 )
    ( on b895 b695 )
    ( on b200 b895 )
    ( on b267 b200 )
    ( on b423 b267 )
    ( on b489 b423 )
    ( on b494 b489 )
    ( on b713 b494 )
    ( on b443 b713 )
    ( on b395 b443 )
    ( on b586 b395 )
    ( on b532 b586 )
    ( on b598 b532 )
    ( on b580 b598 )
    ( on b853 b580 )
    ( on b399 b853 )
    ( on b317 b399 )
    ( on b121 b317 )
    ( clear b121 )
  )
  ( :goal
    ( and
      ( clear b389 )
    )
  )
)
