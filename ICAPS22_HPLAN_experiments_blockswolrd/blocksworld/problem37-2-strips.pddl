( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b723 - block
    b115 - block
    b976 - block
    b797 - block
    b479 - block
    b91 - block
    b586 - block
    b938 - block
    b245 - block
    b642 - block
    b187 - block
    b365 - block
    b497 - block
    b927 - block
    b88 - block
    b667 - block
    b425 - block
    b47 - block
    b971 - block
    b54 - block
    b278 - block
    b279 - block
    b721 - block
    b7 - block
    b612 - block
    b340 - block
    b31 - block
    b1 - block
    b643 - block
    b984 - block
    b457 - block
    b92 - block
    b820 - block
    b10 - block
    b312 - block
    b73 - block
    b319 - block
    b515 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b723 )
    ( on b115 b723 )
    ( on b976 b115 )
    ( on b797 b976 )
    ( on b479 b797 )
    ( on b91 b479 )
    ( on b586 b91 )
    ( on b938 b586 )
    ( on b245 b938 )
    ( on b642 b245 )
    ( on b187 b642 )
    ( on b365 b187 )
    ( on b497 b365 )
    ( on b927 b497 )
    ( on b88 b927 )
    ( on b667 b88 )
    ( on b425 b667 )
    ( on b47 b425 )
    ( on b971 b47 )
    ( on b54 b971 )
    ( on b278 b54 )
    ( on b279 b278 )
    ( on b721 b279 )
    ( on b7 b721 )
    ( on b612 b7 )
    ( on b340 b612 )
    ( on b31 b340 )
    ( on b1 b31 )
    ( on b643 b1 )
    ( on b984 b643 )
    ( on b457 b984 )
    ( on b92 b457 )
    ( on b820 b92 )
    ( on b10 b820 )
    ( on b312 b10 )
    ( on b73 b312 )
    ( on b319 b73 )
    ( on b515 b319 )
    ( clear b515 )
  )
  ( :goal
    ( and
      ( clear b723 )
    )
  )
)
