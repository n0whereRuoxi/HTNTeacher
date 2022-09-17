( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b99 - block
    b935 - block
    b131 - block
    b108 - block
    b341 - block
    b658 - block
    b6 - block
    b523 - block
    b77 - block
    b54 - block
    b829 - block
    b995 - block
    b284 - block
    b583 - block
    b958 - block
    b296 - block
    b56 - block
    b545 - block
    b589 - block
    b546 - block
    b109 - block
    b574 - block
    b787 - block
    b89 - block
    b530 - block
    b810 - block
    b281 - block
    b774 - block
    b788 - block
    b441 - block
    b209 - block
    b993 - block
    b368 - block
    b708 - block
    b294 - block
    b567 - block
    b732 - block
    b39 - block
    b128 - block
    b991 - block
    b156 - block
    b667 - block
    b35 - block
    b293 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b99 )
    ( on b935 b99 )
    ( on b131 b935 )
    ( on b108 b131 )
    ( on b341 b108 )
    ( on b658 b341 )
    ( on b6 b658 )
    ( on b523 b6 )
    ( on b77 b523 )
    ( on b54 b77 )
    ( on b829 b54 )
    ( on b995 b829 )
    ( on b284 b995 )
    ( on b583 b284 )
    ( on b958 b583 )
    ( on b296 b958 )
    ( on b56 b296 )
    ( on b545 b56 )
    ( on b589 b545 )
    ( on b546 b589 )
    ( on b109 b546 )
    ( on b574 b109 )
    ( on b787 b574 )
    ( on b89 b787 )
    ( on b530 b89 )
    ( on b810 b530 )
    ( on b281 b810 )
    ( on b774 b281 )
    ( on b788 b774 )
    ( on b441 b788 )
    ( on b209 b441 )
    ( on b993 b209 )
    ( on b368 b993 )
    ( on b708 b368 )
    ( on b294 b708 )
    ( on b567 b294 )
    ( on b732 b567 )
    ( on b39 b732 )
    ( on b128 b39 )
    ( on b991 b128 )
    ( on b156 b991 )
    ( on b667 b156 )
    ( on b35 b667 )
    ( on b293 b35 )
    ( on b381 b293 )
    ( clear b381 )
  )
  ( :goal
    ( and
      ( clear b99 )
    )
  )
)
