( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b725 - block
    b931 - block
    b56 - block
    b733 - block
    b815 - block
    b180 - block
    b734 - block
    b903 - block
    b270 - block
    b976 - block
    b493 - block
    b333 - block
    b681 - block
    b223 - block
    b224 - block
    b841 - block
    b544 - block
    b664 - block
    b285 - block
    b340 - block
    b462 - block
    b752 - block
    b916 - block
    b747 - block
    b159 - block
    b19 - block
    b372 - block
    b641 - block
    b10 - block
    b351 - block
    b585 - block
    b621 - block
    b829 - block
    b754 - block
    b694 - block
    b49 - block
    b403 - block
    b567 - block
    b296 - block
    b411 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b725 )
    ( on b931 b725 )
    ( on b56 b931 )
    ( on b733 b56 )
    ( on b815 b733 )
    ( on b180 b815 )
    ( on b734 b180 )
    ( on b903 b734 )
    ( on b270 b903 )
    ( on b976 b270 )
    ( on b493 b976 )
    ( on b333 b493 )
    ( on b681 b333 )
    ( on b223 b681 )
    ( on b224 b223 )
    ( on b841 b224 )
    ( on b544 b841 )
    ( on b664 b544 )
    ( on b285 b664 )
    ( on b340 b285 )
    ( on b462 b340 )
    ( on b752 b462 )
    ( on b916 b752 )
    ( on b747 b916 )
    ( on b159 b747 )
    ( on b19 b159 )
    ( on b372 b19 )
    ( on b641 b372 )
    ( on b10 b641 )
    ( on b351 b10 )
    ( on b585 b351 )
    ( on b621 b585 )
    ( on b829 b621 )
    ( on b754 b829 )
    ( on b694 b754 )
    ( on b49 b694 )
    ( on b403 b49 )
    ( on b567 b403 )
    ( on b296 b567 )
    ( on b411 b296 )
    ( clear b411 )
  )
  ( :goal
    ( and
      ( clear b725 )
    )
  )
)
