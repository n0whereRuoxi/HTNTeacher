( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b684 - block
    b311 - block
    b840 - block
    b618 - block
    b523 - block
    b441 - block
    b5 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b684 )
    ( on b311 b684 )
    ( on b840 b311 )
    ( on b618 b840 )
    ( on b523 b618 )
    ( on b441 b523 )
    ( on b5 b441 )
    ( clear b5 )
  )
  ( :tasks
    ( Make-6Pile b311 b840 b618 b523 b441 b5 )
  )
)
