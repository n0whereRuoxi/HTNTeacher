( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b681 - block
    b985 - block
    b758 - block
    b476 - block
    b751 - block
    b732 - block
    b882 - block
    b888 - block
    b490 - block
    b422 - block
    b942 - block
    b161 - block
    b251 - block
    b743 - block
    b914 - block
    b453 - block
    b386 - block
    b525 - block
    b427 - block
    b489 - block
    b669 - block
    b668 - block
    b872 - block
    b359 - block
    b153 - block
    b338 - block
    b165 - block
    b230 - block
    b533 - block
    b718 - block
    b978 - block
    b655 - block
    b229 - block
    b940 - block
    b856 - block
    b199 - block
    b634 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b681 )
    ( on b985 b681 )
    ( on b758 b985 )
    ( on b476 b758 )
    ( on b751 b476 )
    ( on b732 b751 )
    ( on b882 b732 )
    ( on b888 b882 )
    ( on b490 b888 )
    ( on b422 b490 )
    ( on b942 b422 )
    ( on b161 b942 )
    ( on b251 b161 )
    ( on b743 b251 )
    ( on b914 b743 )
    ( on b453 b914 )
    ( on b386 b453 )
    ( on b525 b386 )
    ( on b427 b525 )
    ( on b489 b427 )
    ( on b669 b489 )
    ( on b668 b669 )
    ( on b872 b668 )
    ( on b359 b872 )
    ( on b153 b359 )
    ( on b338 b153 )
    ( on b165 b338 )
    ( on b230 b165 )
    ( on b533 b230 )
    ( on b718 b533 )
    ( on b978 b718 )
    ( on b655 b978 )
    ( on b229 b655 )
    ( on b940 b229 )
    ( on b856 b940 )
    ( on b199 b856 )
    ( on b634 b199 )
    ( clear b634 )
  )
  ( :goal
    ( and
      ( clear b681 )
    )
  )
)
