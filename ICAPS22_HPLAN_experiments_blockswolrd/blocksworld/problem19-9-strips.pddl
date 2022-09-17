( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b642 - block
    b109 - block
    b542 - block
    b354 - block
    b455 - block
    b817 - block
    b527 - block
    b467 - block
    b66 - block
    b317 - block
    b340 - block
    b867 - block
    b496 - block
    b742 - block
    b838 - block
    b292 - block
    b734 - block
    b905 - block
    b755 - block
    b272 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b642 )
    ( on b109 b642 )
    ( on b542 b109 )
    ( on b354 b542 )
    ( on b455 b354 )
    ( on b817 b455 )
    ( on b527 b817 )
    ( on b467 b527 )
    ( on b66 b467 )
    ( on b317 b66 )
    ( on b340 b317 )
    ( on b867 b340 )
    ( on b496 b867 )
    ( on b742 b496 )
    ( on b838 b742 )
    ( on b292 b838 )
    ( on b734 b292 )
    ( on b905 b734 )
    ( on b755 b905 )
    ( on b272 b755 )
    ( clear b272 )
  )
  ( :goal
    ( and
      ( clear b642 )
    )
  )
)
