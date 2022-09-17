( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b354 - block
    b356 - block
    b398 - block
    b183 - block
    b851 - block
    b400 - block
    b248 - block
    b12 - block
    b370 - block
    b167 - block
    b449 - block
    b227 - block
    b558 - block
    b902 - block
    b295 - block
    b675 - block
    b361 - block
    b538 - block
    b136 - block
    b482 - block
    b634 - block
    b29 - block
    b564 - block
    b460 - block
    b435 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b354 )
    ( on b356 b354 )
    ( on b398 b356 )
    ( on b183 b398 )
    ( on b851 b183 )
    ( on b400 b851 )
    ( on b248 b400 )
    ( on b12 b248 )
    ( on b370 b12 )
    ( on b167 b370 )
    ( on b449 b167 )
    ( on b227 b449 )
    ( on b558 b227 )
    ( on b902 b558 )
    ( on b295 b902 )
    ( on b675 b295 )
    ( on b361 b675 )
    ( on b538 b361 )
    ( on b136 b538 )
    ( on b482 b136 )
    ( on b634 b482 )
    ( on b29 b634 )
    ( on b564 b29 )
    ( on b460 b564 )
    ( on b435 b460 )
    ( clear b435 )
  )
  ( :goal
    ( and
      ( clear b354 )
    )
  )
)
