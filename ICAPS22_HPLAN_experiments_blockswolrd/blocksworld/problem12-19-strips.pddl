( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b85 - block
    b224 - block
    b784 - block
    b354 - block
    b626 - block
    b371 - block
    b279 - block
    b847 - block
    b637 - block
    b16 - block
    b575 - block
    b392 - block
    b416 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b85 )
    ( on b224 b85 )
    ( on b784 b224 )
    ( on b354 b784 )
    ( on b626 b354 )
    ( on b371 b626 )
    ( on b279 b371 )
    ( on b847 b279 )
    ( on b637 b847 )
    ( on b16 b637 )
    ( on b575 b16 )
    ( on b392 b575 )
    ( on b416 b392 )
    ( clear b416 )
  )
  ( :goal
    ( and
      ( clear b85 )
    )
  )
)
