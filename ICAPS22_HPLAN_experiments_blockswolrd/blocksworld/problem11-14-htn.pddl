( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b706 - block
    b244 - block
    b496 - block
    b595 - block
    b123 - block
    b82 - block
    b524 - block
    b115 - block
    b371 - block
    b443 - block
    b229 - block
    b419 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b706 )
    ( on b244 b706 )
    ( on b496 b244 )
    ( on b595 b496 )
    ( on b123 b595 )
    ( on b82 b123 )
    ( on b524 b82 )
    ( on b115 b524 )
    ( on b371 b115 )
    ( on b443 b371 )
    ( on b229 b443 )
    ( on b419 b229 )
    ( clear b419 )
  )
  ( :tasks
    ( Make-11Pile b244 b496 b595 b123 b82 b524 b115 b371 b443 b229 b419 )
  )
)
