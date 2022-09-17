( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b486 - block
    b543 - block
    b494 - block
    b21 - block
    b184 - block
    b798 - block
    b986 - block
    b351 - block
    b185 - block
    b454 - block
    b595 - block
    b463 - block
    b17 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b486 )
    ( on b543 b486 )
    ( on b494 b543 )
    ( on b21 b494 )
    ( on b184 b21 )
    ( on b798 b184 )
    ( on b986 b798 )
    ( on b351 b986 )
    ( on b185 b351 )
    ( on b454 b185 )
    ( on b595 b454 )
    ( on b463 b595 )
    ( on b17 b463 )
    ( clear b17 )
  )
  ( :goal
    ( and
      ( clear b486 )
    )
  )
)
