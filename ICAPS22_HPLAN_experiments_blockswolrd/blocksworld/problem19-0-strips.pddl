( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b429 - block
    b36 - block
    b94 - block
    b281 - block
    b980 - block
    b143 - block
    b231 - block
    b272 - block
    b743 - block
    b480 - block
    b364 - block
    b604 - block
    b153 - block
    b991 - block
    b758 - block
    b365 - block
    b27 - block
    b994 - block
    b982 - block
    b151 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b429 )
    ( on b36 b429 )
    ( on b94 b36 )
    ( on b281 b94 )
    ( on b980 b281 )
    ( on b143 b980 )
    ( on b231 b143 )
    ( on b272 b231 )
    ( on b743 b272 )
    ( on b480 b743 )
    ( on b364 b480 )
    ( on b604 b364 )
    ( on b153 b604 )
    ( on b991 b153 )
    ( on b758 b991 )
    ( on b365 b758 )
    ( on b27 b365 )
    ( on b994 b27 )
    ( on b982 b994 )
    ( on b151 b982 )
    ( clear b151 )
  )
  ( :goal
    ( and
      ( clear b429 )
    )
  )
)
