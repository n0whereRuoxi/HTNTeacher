( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b676 - block
    b681 - block
    b985 - block
    b10 - block
    b309 - block
    b565 - block
    b657 - block
    b3 - block
    b758 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b676 )
    ( on b681 b676 )
    ( on b985 b681 )
    ( on b10 b985 )
    ( on b309 b10 )
    ( on b565 b309 )
    ( on b657 b565 )
    ( on b3 b657 )
    ( on b758 b3 )
    ( clear b758 )
  )
  ( :tasks
    ( Make-8Pile b681 b985 b10 b309 b565 b657 b3 b758 )
  )
)
