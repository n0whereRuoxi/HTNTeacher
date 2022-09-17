( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b232 - block
    b720 - block
    b623 - block
    b896 - block
    b295 - block
    b150 - block
    b576 - block
    b451 - block
    b604 - block
    b290 - block
    b537 - block
    b119 - block
    b965 - block
    b632 - block
    b825 - block
    b32 - block
    b665 - block
    b97 - block
    b799 - block
    b944 - block
    b142 - block
    b217 - block
    b512 - block
    b992 - block
    b12 - block
    b685 - block
    b383 - block
    b204 - block
    b210 - block
    b857 - block
    b471 - block
    b139 - block
    b42 - block
    b997 - block
    b652 - block
    b996 - block
    b8 - block
    b409 - block
    b523 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b232 )
    ( on b720 b232 )
    ( on b623 b720 )
    ( on b896 b623 )
    ( on b295 b896 )
    ( on b150 b295 )
    ( on b576 b150 )
    ( on b451 b576 )
    ( on b604 b451 )
    ( on b290 b604 )
    ( on b537 b290 )
    ( on b119 b537 )
    ( on b965 b119 )
    ( on b632 b965 )
    ( on b825 b632 )
    ( on b32 b825 )
    ( on b665 b32 )
    ( on b97 b665 )
    ( on b799 b97 )
    ( on b944 b799 )
    ( on b142 b944 )
    ( on b217 b142 )
    ( on b512 b217 )
    ( on b992 b512 )
    ( on b12 b992 )
    ( on b685 b12 )
    ( on b383 b685 )
    ( on b204 b383 )
    ( on b210 b204 )
    ( on b857 b210 )
    ( on b471 b857 )
    ( on b139 b471 )
    ( on b42 b139 )
    ( on b997 b42 )
    ( on b652 b997 )
    ( on b996 b652 )
    ( on b8 b996 )
    ( on b409 b8 )
    ( on b523 b409 )
    ( clear b523 )
  )
  ( :goal
    ( and
      ( clear b232 )
    )
  )
)
