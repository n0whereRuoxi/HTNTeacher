( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b339 - block
    b383 - block
    b367 - block
    b397 - block
    b739 - block
    b581 - block
    b553 - block
    b183 - block
    b811 - block
    b331 - block
    b346 - block
    b89 - block
    b45 - block
    b315 - block
    b364 - block
    b256 - block
    b435 - block
    b272 - block
    b467 - block
    b929 - block
    b541 - block
    b167 - block
    b690 - block
    b812 - block
    b932 - block
    b171 - block
    b324 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b383 b339 )
    ( on b367 b383 )
    ( on b397 b367 )
    ( on b739 b397 )
    ( on b581 b739 )
    ( on b553 b581 )
    ( on b183 b553 )
    ( on b811 b183 )
    ( on b331 b811 )
    ( on b346 b331 )
    ( on b89 b346 )
    ( on b45 b89 )
    ( on b315 b45 )
    ( on b364 b315 )
    ( on b256 b364 )
    ( on b435 b256 )
    ( on b272 b435 )
    ( on b467 b272 )
    ( on b929 b467 )
    ( on b541 b929 )
    ( on b167 b541 )
    ( on b690 b167 )
    ( on b812 b690 )
    ( on b932 b812 )
    ( on b171 b932 )
    ( on b324 b171 )
    ( clear b324 )
  )
  ( :goal
    ( and
      ( clear b339 )
    )
  )
)
