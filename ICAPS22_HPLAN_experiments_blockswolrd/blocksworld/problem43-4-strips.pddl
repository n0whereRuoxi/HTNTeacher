( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b913 - block
    b181 - block
    b681 - block
    b939 - block
    b202 - block
    b421 - block
    b727 - block
    b272 - block
    b426 - block
    b397 - block
    b134 - block
    b477 - block
    b708 - block
    b608 - block
    b424 - block
    b530 - block
    b47 - block
    b921 - block
    b459 - block
    b411 - block
    b610 - block
    b870 - block
    b407 - block
    b29 - block
    b242 - block
    b220 - block
    b293 - block
    b179 - block
    b314 - block
    b635 - block
    b618 - block
    b699 - block
    b464 - block
    b146 - block
    b198 - block
    b621 - block
    b98 - block
    b533 - block
    b650 - block
    b362 - block
    b467 - block
    b138 - block
    b371 - block
    b720 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b913 )
    ( on b181 b913 )
    ( on b681 b181 )
    ( on b939 b681 )
    ( on b202 b939 )
    ( on b421 b202 )
    ( on b727 b421 )
    ( on b272 b727 )
    ( on b426 b272 )
    ( on b397 b426 )
    ( on b134 b397 )
    ( on b477 b134 )
    ( on b708 b477 )
    ( on b608 b708 )
    ( on b424 b608 )
    ( on b530 b424 )
    ( on b47 b530 )
    ( on b921 b47 )
    ( on b459 b921 )
    ( on b411 b459 )
    ( on b610 b411 )
    ( on b870 b610 )
    ( on b407 b870 )
    ( on b29 b407 )
    ( on b242 b29 )
    ( on b220 b242 )
    ( on b293 b220 )
    ( on b179 b293 )
    ( on b314 b179 )
    ( on b635 b314 )
    ( on b618 b635 )
    ( on b699 b618 )
    ( on b464 b699 )
    ( on b146 b464 )
    ( on b198 b146 )
    ( on b621 b198 )
    ( on b98 b621 )
    ( on b533 b98 )
    ( on b650 b533 )
    ( on b362 b650 )
    ( on b467 b362 )
    ( on b138 b467 )
    ( on b371 b138 )
    ( on b720 b371 )
    ( clear b720 )
  )
  ( :goal
    ( and
      ( clear b913 )
    )
  )
)
