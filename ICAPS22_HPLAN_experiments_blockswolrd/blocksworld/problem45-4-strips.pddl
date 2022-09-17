( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b740 - block
    b19 - block
    b170 - block
    b542 - block
    b548 - block
    b480 - block
    b472 - block
    b370 - block
    b736 - block
    b996 - block
    b403 - block
    b822 - block
    b868 - block
    b38 - block
    b295 - block
    b371 - block
    b601 - block
    b436 - block
    b97 - block
    b686 - block
    b496 - block
    b922 - block
    b873 - block
    b248 - block
    b452 - block
    b849 - block
    b467 - block
    b287 - block
    b262 - block
    b706 - block
    b212 - block
    b778 - block
    b216 - block
    b121 - block
    b160 - block
    b995 - block
    b441 - block
    b802 - block
    b418 - block
    b671 - block
    b307 - block
    b456 - block
    b484 - block
    b674 - block
    b503 - block
    b906 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b740 )
    ( on b19 b740 )
    ( on b170 b19 )
    ( on b542 b170 )
    ( on b548 b542 )
    ( on b480 b548 )
    ( on b472 b480 )
    ( on b370 b472 )
    ( on b736 b370 )
    ( on b996 b736 )
    ( on b403 b996 )
    ( on b822 b403 )
    ( on b868 b822 )
    ( on b38 b868 )
    ( on b295 b38 )
    ( on b371 b295 )
    ( on b601 b371 )
    ( on b436 b601 )
    ( on b97 b436 )
    ( on b686 b97 )
    ( on b496 b686 )
    ( on b922 b496 )
    ( on b873 b922 )
    ( on b248 b873 )
    ( on b452 b248 )
    ( on b849 b452 )
    ( on b467 b849 )
    ( on b287 b467 )
    ( on b262 b287 )
    ( on b706 b262 )
    ( on b212 b706 )
    ( on b778 b212 )
    ( on b216 b778 )
    ( on b121 b216 )
    ( on b160 b121 )
    ( on b995 b160 )
    ( on b441 b995 )
    ( on b802 b441 )
    ( on b418 b802 )
    ( on b671 b418 )
    ( on b307 b671 )
    ( on b456 b307 )
    ( on b484 b456 )
    ( on b674 b484 )
    ( on b503 b674 )
    ( on b906 b503 )
    ( clear b906 )
  )
  ( :goal
    ( and
      ( clear b740 )
    )
  )
)
