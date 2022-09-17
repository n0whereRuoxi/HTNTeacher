( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b721 - block
    b494 - block
    b768 - block
    b680 - block
    b948 - block
    b385 - block
    b406 - block
    b364 - block
    b391 - block
    b316 - block
    b891 - block
    b25 - block
    b671 - block
    b66 - block
    b101 - block
    b884 - block
    b459 - block
    b730 - block
    b276 - block
    b486 - block
    b726 - block
    b130 - block
    b954 - block
    b559 - block
    b554 - block
    b280 - block
    b436 - block
    b97 - block
    b766 - block
    b303 - block
    b150 - block
    b597 - block
    b987 - block
    b388 - block
    b588 - block
    b420 - block
    b11 - block
    b822 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b721 )
    ( on b494 b721 )
    ( on b768 b494 )
    ( on b680 b768 )
    ( on b948 b680 )
    ( on b385 b948 )
    ( on b406 b385 )
    ( on b364 b406 )
    ( on b391 b364 )
    ( on b316 b391 )
    ( on b891 b316 )
    ( on b25 b891 )
    ( on b671 b25 )
    ( on b66 b671 )
    ( on b101 b66 )
    ( on b884 b101 )
    ( on b459 b884 )
    ( on b730 b459 )
    ( on b276 b730 )
    ( on b486 b276 )
    ( on b726 b486 )
    ( on b130 b726 )
    ( on b954 b130 )
    ( on b559 b954 )
    ( on b554 b559 )
    ( on b280 b554 )
    ( on b436 b280 )
    ( on b97 b436 )
    ( on b766 b97 )
    ( on b303 b766 )
    ( on b150 b303 )
    ( on b597 b150 )
    ( on b987 b597 )
    ( on b388 b987 )
    ( on b588 b388 )
    ( on b420 b588 )
    ( on b11 b420 )
    ( on b822 b11 )
    ( clear b822 )
  )
  ( :goal
    ( and
      ( clear b721 )
    )
  )
)
