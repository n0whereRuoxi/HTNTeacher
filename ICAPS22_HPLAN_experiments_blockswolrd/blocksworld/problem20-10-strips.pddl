( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b929 - block
    b504 - block
    b511 - block
    b699 - block
    b989 - block
    b846 - block
    b729 - block
    b129 - block
    b389 - block
    b703 - block
    b431 - block
    b127 - block
    b360 - block
    b462 - block
    b735 - block
    b916 - block
    b728 - block
    b489 - block
    b105 - block
    b695 - block
    b739 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b929 )
    ( on b504 b929 )
    ( on b511 b504 )
    ( on b699 b511 )
    ( on b989 b699 )
    ( on b846 b989 )
    ( on b729 b846 )
    ( on b129 b729 )
    ( on b389 b129 )
    ( on b703 b389 )
    ( on b431 b703 )
    ( on b127 b431 )
    ( on b360 b127 )
    ( on b462 b360 )
    ( on b735 b462 )
    ( on b916 b735 )
    ( on b728 b916 )
    ( on b489 b728 )
    ( on b105 b489 )
    ( on b695 b105 )
    ( on b739 b695 )
    ( clear b739 )
  )
  ( :goal
    ( and
      ( clear b929 )
    )
  )
)
