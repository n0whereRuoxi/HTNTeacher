( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b802 - block
    b599 - block
    b622 - block
    b7 - block
    b887 - block
    b806 - block
    b95 - block
    b363 - block
    b849 - block
    b731 - block
    b960 - block
    b854 - block
    b538 - block
    b88 - block
    b591 - block
    b253 - block
    b286 - block
    b866 - block
    b282 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b802 )
    ( on b599 b802 )
    ( on b622 b599 )
    ( on b7 b622 )
    ( on b887 b7 )
    ( on b806 b887 )
    ( on b95 b806 )
    ( on b363 b95 )
    ( on b849 b363 )
    ( on b731 b849 )
    ( on b960 b731 )
    ( on b854 b960 )
    ( on b538 b854 )
    ( on b88 b538 )
    ( on b591 b88 )
    ( on b253 b591 )
    ( on b286 b253 )
    ( on b866 b286 )
    ( on b282 b866 )
    ( clear b282 )
  )
  ( :goal
    ( and
      ( clear b802 )
    )
  )
)
