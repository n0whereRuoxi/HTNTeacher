( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b63 - block
    b329 - block
    b235 - block
    b426 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b63 )
    ( on b329 b63 )
    ( on b235 b329 )
    ( on b426 b235 )
    ( clear b426 )
  )
  ( :tasks
    ( Make-3Pile b329 b235 b426 )
  )
)
