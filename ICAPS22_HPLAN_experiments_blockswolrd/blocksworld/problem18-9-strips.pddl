( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b390 - block
    b685 - block
    b289 - block
    b125 - block
    b287 - block
    b619 - block
    b143 - block
    b911 - block
    b664 - block
    b46 - block
    b930 - block
    b107 - block
    b422 - block
    b739 - block
    b544 - block
    b688 - block
    b967 - block
    b204 - block
    b600 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b390 )
    ( on b685 b390 )
    ( on b289 b685 )
    ( on b125 b289 )
    ( on b287 b125 )
    ( on b619 b287 )
    ( on b143 b619 )
    ( on b911 b143 )
    ( on b664 b911 )
    ( on b46 b664 )
    ( on b930 b46 )
    ( on b107 b930 )
    ( on b422 b107 )
    ( on b739 b422 )
    ( on b544 b739 )
    ( on b688 b544 )
    ( on b967 b688 )
    ( on b204 b967 )
    ( on b600 b204 )
    ( clear b600 )
  )
  ( :goal
    ( and
      ( clear b390 )
    )
  )
)
