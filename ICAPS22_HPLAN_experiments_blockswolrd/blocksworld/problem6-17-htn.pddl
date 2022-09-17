( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b56 - block
    b129 - block
    b194 - block
    b930 - block
    b697 - block
    b580 - block
    b840 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b56 )
    ( on b129 b56 )
    ( on b194 b129 )
    ( on b930 b194 )
    ( on b697 b930 )
    ( on b580 b697 )
    ( on b840 b580 )
    ( clear b840 )
  )
  ( :tasks
    ( Make-6Pile b129 b194 b930 b697 b580 b840 )
  )
)
