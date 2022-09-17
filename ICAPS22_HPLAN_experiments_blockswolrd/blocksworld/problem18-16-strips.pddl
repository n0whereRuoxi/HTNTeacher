( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b93 - block
    b801 - block
    b57 - block
    b681 - block
    b606 - block
    b870 - block
    b548 - block
    b600 - block
    b54 - block
    b576 - block
    b511 - block
    b39 - block
    b18 - block
    b104 - block
    b795 - block
    b411 - block
    b539 - block
    b989 - block
    b882 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b93 )
    ( on b801 b93 )
    ( on b57 b801 )
    ( on b681 b57 )
    ( on b606 b681 )
    ( on b870 b606 )
    ( on b548 b870 )
    ( on b600 b548 )
    ( on b54 b600 )
    ( on b576 b54 )
    ( on b511 b576 )
    ( on b39 b511 )
    ( on b18 b39 )
    ( on b104 b18 )
    ( on b795 b104 )
    ( on b411 b795 )
    ( on b539 b411 )
    ( on b989 b539 )
    ( on b882 b989 )
    ( clear b882 )
  )
  ( :goal
    ( and
      ( clear b93 )
    )
  )
)
