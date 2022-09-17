( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b119 - block
    b621 - block
    b844 - block
    b671 - block
    b689 - block
    b999 - block
    b778 - block
    b492 - block
    b648 - block
    b889 - block
    b300 - block
    b357 - block
    b876 - block
    b803 - block
    b332 - block
    b454 - block
    b82 - block
    b674 - block
    b775 - block
    b513 - block
    b632 - block
    b646 - block
    b365 - block
    b993 - block
    b964 - block
    b344 - block
    b250 - block
    b587 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b119 )
    ( on b621 b119 )
    ( on b844 b621 )
    ( on b671 b844 )
    ( on b689 b671 )
    ( on b999 b689 )
    ( on b778 b999 )
    ( on b492 b778 )
    ( on b648 b492 )
    ( on b889 b648 )
    ( on b300 b889 )
    ( on b357 b300 )
    ( on b876 b357 )
    ( on b803 b876 )
    ( on b332 b803 )
    ( on b454 b332 )
    ( on b82 b454 )
    ( on b674 b82 )
    ( on b775 b674 )
    ( on b513 b775 )
    ( on b632 b513 )
    ( on b646 b632 )
    ( on b365 b646 )
    ( on b993 b365 )
    ( on b964 b993 )
    ( on b344 b964 )
    ( on b250 b344 )
    ( on b587 b250 )
    ( clear b587 )
  )
  ( :goal
    ( and
      ( clear b119 )
    )
  )
)
