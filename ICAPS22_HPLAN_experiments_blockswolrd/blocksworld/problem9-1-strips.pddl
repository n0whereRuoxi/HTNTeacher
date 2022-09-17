( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b290 - block
    b625 - block
    b972 - block
    b281 - block
    b66 - block
    b563 - block
    b415 - block
    b317 - block
    b805 - block
    b545 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b290 )
    ( on b625 b290 )
    ( on b972 b625 )
    ( on b281 b972 )
    ( on b66 b281 )
    ( on b563 b66 )
    ( on b415 b563 )
    ( on b317 b415 )
    ( on b805 b317 )
    ( on b545 b805 )
    ( clear b545 )
  )
  ( :goal
    ( and
      ( clear b290 )
    )
  )
)
