( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b528 - block
    b883 - block
    b151 - block
    b597 - block
    b339 - block
    b768 - block
    b400 - block
    b346 - block
    b357 - block
    b12 - block
    b658 - block
    b558 - block
    b573 - block
    b267 - block
    b318 - block
    b629 - block
    b495 - block
    b435 - block
    b615 - block
    b51 - block
    b519 - block
    b863 - block
    b372 - block
    b209 - block
    b938 - block
    b610 - block
    b358 - block
    b811 - block
    b249 - block
    b421 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b528 )
    ( on b883 b528 )
    ( on b151 b883 )
    ( on b597 b151 )
    ( on b339 b597 )
    ( on b768 b339 )
    ( on b400 b768 )
    ( on b346 b400 )
    ( on b357 b346 )
    ( on b12 b357 )
    ( on b658 b12 )
    ( on b558 b658 )
    ( on b573 b558 )
    ( on b267 b573 )
    ( on b318 b267 )
    ( on b629 b318 )
    ( on b495 b629 )
    ( on b435 b495 )
    ( on b615 b435 )
    ( on b51 b615 )
    ( on b519 b51 )
    ( on b863 b519 )
    ( on b372 b863 )
    ( on b209 b372 )
    ( on b938 b209 )
    ( on b610 b938 )
    ( on b358 b610 )
    ( on b811 b358 )
    ( on b249 b811 )
    ( on b421 b249 )
    ( clear b421 )
  )
  ( :goal
    ( and
      ( clear b528 )
    )
  )
)
