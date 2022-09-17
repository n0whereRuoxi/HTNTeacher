( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b652 - block
    b633 - block
    b508 - block
    b541 - block
    b495 - block
    b558 - block
    b827 - block
    b191 - block
    b622 - block
    b328 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b652 )
    ( on b633 b652 )
    ( on b508 b633 )
    ( on b541 b508 )
    ( on b495 b541 )
    ( on b558 b495 )
    ( on b827 b558 )
    ( on b191 b827 )
    ( on b622 b191 )
    ( on b328 b622 )
    ( clear b328 )
  )
  ( :tasks
    ( Make-9Pile b633 b508 b541 b495 b558 b827 b191 b622 b328 )
  )
)
