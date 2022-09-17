( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b493 - block
    b395 - block
    b230 - block
    b794 - block
    b410 - block
    b421 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b493 )
    ( on b395 b493 )
    ( on b230 b395 )
    ( on b794 b230 )
    ( on b410 b794 )
    ( on b421 b410 )
    ( clear b421 )
  )
  ( :tasks
    ( Make-5Pile b395 b230 b794 b410 b421 )
  )
)
