( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b383 - block
    b389 - block
    b830 - block
    b750 - block
    b828 - block
    b966 - block
    b737 - block
    b886 - block
    b228 - block
    b784 - block
    b578 - block
    b82 - block
    b678 - block
    b557 - block
    b445 - block
    b743 - block
    b918 - block
    b37 - block
    b100 - block
    b44 - block
    b427 - block
    b633 - block
    b884 - block
    b631 - block
    b364 - block
    b53 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b383 )
    ( on b389 b383 )
    ( on b830 b389 )
    ( on b750 b830 )
    ( on b828 b750 )
    ( on b966 b828 )
    ( on b737 b966 )
    ( on b886 b737 )
    ( on b228 b886 )
    ( on b784 b228 )
    ( on b578 b784 )
    ( on b82 b578 )
    ( on b678 b82 )
    ( on b557 b678 )
    ( on b445 b557 )
    ( on b743 b445 )
    ( on b918 b743 )
    ( on b37 b918 )
    ( on b100 b37 )
    ( on b44 b100 )
    ( on b427 b44 )
    ( on b633 b427 )
    ( on b884 b633 )
    ( on b631 b884 )
    ( on b364 b631 )
    ( on b53 b364 )
    ( clear b53 )
  )
  ( :goal
    ( and
      ( clear b383 )
    )
  )
)
