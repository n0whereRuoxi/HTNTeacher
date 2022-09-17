( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b14 - block
    b93 - block
    b598 - block
    b540 - block
    b432 - block
    b852 - block
    b73 - block
    b624 - block
    b321 - block
    b983 - block
    b806 - block
    b639 - block
    b799 - block
    b589 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b14 )
    ( on b93 b14 )
    ( on b598 b93 )
    ( on b540 b598 )
    ( on b432 b540 )
    ( on b852 b432 )
    ( on b73 b852 )
    ( on b624 b73 )
    ( on b321 b624 )
    ( on b983 b321 )
    ( on b806 b983 )
    ( on b639 b806 )
    ( on b799 b639 )
    ( on b589 b799 )
    ( clear b589 )
  )
  ( :goal
    ( and
      ( clear b14 )
    )
  )
)
