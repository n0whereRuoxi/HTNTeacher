( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b120 - block
    b46 - block
    b493 - block
    b235 - block
    b44 - block
    b341 - block
    b240 - block
    b102 - block
    b957 - block
    b365 - block
    b867 - block
    b651 - block
    b81 - block
    b582 - block
    b297 - block
    b865 - block
    b263 - block
    b551 - block
    b439 - block
    b23 - block
    b245 - block
    b273 - block
    b566 - block
    b77 - block
    b189 - block
    b396 - block
    b497 - block
    b882 - block
    b181 - block
    b385 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b120 )
    ( on b46 b120 )
    ( on b493 b46 )
    ( on b235 b493 )
    ( on b44 b235 )
    ( on b341 b44 )
    ( on b240 b341 )
    ( on b102 b240 )
    ( on b957 b102 )
    ( on b365 b957 )
    ( on b867 b365 )
    ( on b651 b867 )
    ( on b81 b651 )
    ( on b582 b81 )
    ( on b297 b582 )
    ( on b865 b297 )
    ( on b263 b865 )
    ( on b551 b263 )
    ( on b439 b551 )
    ( on b23 b439 )
    ( on b245 b23 )
    ( on b273 b245 )
    ( on b566 b273 )
    ( on b77 b566 )
    ( on b189 b77 )
    ( on b396 b189 )
    ( on b497 b396 )
    ( on b882 b497 )
    ( on b181 b882 )
    ( on b385 b181 )
    ( clear b385 )
  )
  ( :goal
    ( and
      ( clear b120 )
    )
  )
)
