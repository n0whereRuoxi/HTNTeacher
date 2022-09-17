( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b689 - block
    b296 - block
    b667 - block
    b483 - block
    b567 - block
    b684 - block
    b692 - block
    b152 - block
    b91 - block
    b104 - block
    b651 - block
    b80 - block
    b475 - block
    b608 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b689 )
    ( on b296 b689 )
    ( on b667 b296 )
    ( on b483 b667 )
    ( on b567 b483 )
    ( on b684 b567 )
    ( on b692 b684 )
    ( on b152 b692 )
    ( on b91 b152 )
    ( on b104 b91 )
    ( on b651 b104 )
    ( on b80 b651 )
    ( on b475 b80 )
    ( on b608 b475 )
    ( clear b608 )
  )
  ( :tasks
    ( Make-13Pile b296 b667 b483 b567 b684 b692 b152 b91 b104 b651 b80 b475 b608 )
  )
)
