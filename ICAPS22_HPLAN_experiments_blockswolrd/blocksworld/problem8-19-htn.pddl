( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b718 - block
    b764 - block
    b544 - block
    b13 - block
    b588 - block
    b559 - block
    b816 - block
    b626 - block
    b364 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b718 )
    ( on b764 b718 )
    ( on b544 b764 )
    ( on b13 b544 )
    ( on b588 b13 )
    ( on b559 b588 )
    ( on b816 b559 )
    ( on b626 b816 )
    ( on b364 b626 )
    ( clear b364 )
  )
  ( :tasks
    ( Make-8Pile b764 b544 b13 b588 b559 b816 b626 b364 )
  )
)
