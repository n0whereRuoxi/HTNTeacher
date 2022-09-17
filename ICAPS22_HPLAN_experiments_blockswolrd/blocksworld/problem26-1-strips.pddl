( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b376 - block
    b64 - block
    b538 - block
    b408 - block
    b389 - block
    b53 - block
    b560 - block
    b906 - block
    b253 - block
    b226 - block
    b516 - block
    b284 - block
    b548 - block
    b922 - block
    b741 - block
    b119 - block
    b637 - block
    b13 - block
    b307 - block
    b712 - block
    b47 - block
    b120 - block
    b377 - block
    b630 - block
    b900 - block
    b152 - block
    b709 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b376 )
    ( on b64 b376 )
    ( on b538 b64 )
    ( on b408 b538 )
    ( on b389 b408 )
    ( on b53 b389 )
    ( on b560 b53 )
    ( on b906 b560 )
    ( on b253 b906 )
    ( on b226 b253 )
    ( on b516 b226 )
    ( on b284 b516 )
    ( on b548 b284 )
    ( on b922 b548 )
    ( on b741 b922 )
    ( on b119 b741 )
    ( on b637 b119 )
    ( on b13 b637 )
    ( on b307 b13 )
    ( on b712 b307 )
    ( on b47 b712 )
    ( on b120 b47 )
    ( on b377 b120 )
    ( on b630 b377 )
    ( on b900 b630 )
    ( on b152 b900 )
    ( on b709 b152 )
    ( clear b709 )
  )
  ( :goal
    ( and
      ( clear b376 )
    )
  )
)
