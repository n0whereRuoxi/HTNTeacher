( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b185 - block
    b775 - block
    b849 - block
    b938 - block
    b421 - block
    b822 - block
    b58 - block
    b555 - block
    b474 - block
    b687 - block
    b544 - block
    b722 - block
    b329 - block
    b839 - block
    b538 - block
    b91 - block
    b449 - block
    b179 - block
    b253 - block
    b565 - block
    b160 - block
    b181 - block
    b479 - block
    b551 - block
    b352 - block
    b483 - block
    b946 - block
    b242 - block
    b732 - block
    b741 - block
    b163 - block
    b948 - block
    b940 - block
    b440 - block
    b582 - block
    b916 - block
    b121 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b185 )
    ( on b775 b185 )
    ( on b849 b775 )
    ( on b938 b849 )
    ( on b421 b938 )
    ( on b822 b421 )
    ( on b58 b822 )
    ( on b555 b58 )
    ( on b474 b555 )
    ( on b687 b474 )
    ( on b544 b687 )
    ( on b722 b544 )
    ( on b329 b722 )
    ( on b839 b329 )
    ( on b538 b839 )
    ( on b91 b538 )
    ( on b449 b91 )
    ( on b179 b449 )
    ( on b253 b179 )
    ( on b565 b253 )
    ( on b160 b565 )
    ( on b181 b160 )
    ( on b479 b181 )
    ( on b551 b479 )
    ( on b352 b551 )
    ( on b483 b352 )
    ( on b946 b483 )
    ( on b242 b946 )
    ( on b732 b242 )
    ( on b741 b732 )
    ( on b163 b741 )
    ( on b948 b163 )
    ( on b940 b948 )
    ( on b440 b940 )
    ( on b582 b440 )
    ( on b916 b582 )
    ( on b121 b916 )
    ( clear b121 )
  )
  ( :goal
    ( and
      ( clear b185 )
    )
  )
)
