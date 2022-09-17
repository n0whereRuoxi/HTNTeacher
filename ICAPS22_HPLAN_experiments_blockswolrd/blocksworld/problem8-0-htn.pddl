( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b824 - block
    b713 - block
    b214 - block
    b402 - block
    b308 - block
    b715 - block
    b422 - block
    b831 - block
    b320 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b824 )
    ( on b713 b824 )
    ( on b214 b713 )
    ( on b402 b214 )
    ( on b308 b402 )
    ( on b715 b308 )
    ( on b422 b715 )
    ( on b831 b422 )
    ( on b320 b831 )
    ( clear b320 )
  )
  ( :tasks
    ( Make-8Pile b713 b214 b402 b308 b715 b422 b831 b320 )
  )
)
