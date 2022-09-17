( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b489 - block
    b754 - block
    b709 - block
    b579 - block
    b295 - block
    b325 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b489 )
    ( on b754 b489 )
    ( on b709 b754 )
    ( on b579 b709 )
    ( on b295 b579 )
    ( on b325 b295 )
    ( clear b325 )
  )
  ( :goal
    ( and
      ( clear b489 )
    )
  )
)
