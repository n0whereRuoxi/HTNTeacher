( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b18 - block
    b202 - block
    b705 - block
    b725 - block
    b402 - block
    b561 - block
    b294 - block
    b588 - block
    b842 - block
    b22 - block
    b452 - block
    b341 - block
    b407 - block
    b727 - block
    b53 - block
    b625 - block
    b3 - block
    b596 - block
    b663 - block
    b14 - block
    b979 - block
    b31 - block
    b765 - block
    b74 - block
    b465 - block
    b500 - block
    b858 - block
    b433 - block
    b759 - block
    b360 - block
    b230 - block
    b640 - block
    b784 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b18 )
    ( on b202 b18 )
    ( on b705 b202 )
    ( on b725 b705 )
    ( on b402 b725 )
    ( on b561 b402 )
    ( on b294 b561 )
    ( on b588 b294 )
    ( on b842 b588 )
    ( on b22 b842 )
    ( on b452 b22 )
    ( on b341 b452 )
    ( on b407 b341 )
    ( on b727 b407 )
    ( on b53 b727 )
    ( on b625 b53 )
    ( on b3 b625 )
    ( on b596 b3 )
    ( on b663 b596 )
    ( on b14 b663 )
    ( on b979 b14 )
    ( on b31 b979 )
    ( on b765 b31 )
    ( on b74 b765 )
    ( on b465 b74 )
    ( on b500 b465 )
    ( on b858 b500 )
    ( on b433 b858 )
    ( on b759 b433 )
    ( on b360 b759 )
    ( on b230 b360 )
    ( on b640 b230 )
    ( on b784 b640 )
    ( clear b784 )
  )
  ( :goal
    ( and
      ( clear b18 )
    )
  )
)
