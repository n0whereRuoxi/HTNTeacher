( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b974 - block
    b836 - block
    b132 - block
    b910 - block
    b320 - block
    b662 - block
    b822 - block
    b337 - block
    b990 - block
    b488 - block
    b538 - block
    b906 - block
    b73 - block
    b719 - block
    b286 - block
    b290 - block
    b80 - block
    b376 - block
    b575 - block
    b278 - block
    b494 - block
    b831 - block
    b377 - block
    b178 - block
    b102 - block
    b513 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b974 )
    ( on b836 b974 )
    ( on b132 b836 )
    ( on b910 b132 )
    ( on b320 b910 )
    ( on b662 b320 )
    ( on b822 b662 )
    ( on b337 b822 )
    ( on b990 b337 )
    ( on b488 b990 )
    ( on b538 b488 )
    ( on b906 b538 )
    ( on b73 b906 )
    ( on b719 b73 )
    ( on b286 b719 )
    ( on b290 b286 )
    ( on b80 b290 )
    ( on b376 b80 )
    ( on b575 b376 )
    ( on b278 b575 )
    ( on b494 b278 )
    ( on b831 b494 )
    ( on b377 b831 )
    ( on b178 b377 )
    ( on b102 b178 )
    ( on b513 b102 )
    ( clear b513 )
  )
  ( :tasks
    ( Make-25Pile b836 b132 b910 b320 b662 b822 b337 b990 b488 b538 b906 b73 b719 b286 b290 b80 b376 b575 b278 b494 b831 b377 b178 b102 b513 )
  )
)
