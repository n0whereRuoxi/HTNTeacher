( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b707 - block
    b454 - block
    b149 - block
    b301 - block
    b165 - block
    b16 - block
    b763 - block
    b318 - block
    b361 - block
    b975 - block
    b642 - block
    b107 - block
    b418 - block
    b857 - block
    b828 - block
    b401 - block
    b735 - block
    b722 - block
    b55 - block
    b262 - block
    b105 - block
    b930 - block
    b12 - block
    b119 - block
    b897 - block
    b956 - block
    b1 - block
    b815 - block
    b676 - block
    b389 - block
    b740 - block
    b472 - block
    b898 - block
    b518 - block
    b57 - block
    b701 - block
    b748 - block
    b307 - block
    b514 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b707 )
    ( on b454 b707 )
    ( on b149 b454 )
    ( on b301 b149 )
    ( on b165 b301 )
    ( on b16 b165 )
    ( on b763 b16 )
    ( on b318 b763 )
    ( on b361 b318 )
    ( on b975 b361 )
    ( on b642 b975 )
    ( on b107 b642 )
    ( on b418 b107 )
    ( on b857 b418 )
    ( on b828 b857 )
    ( on b401 b828 )
    ( on b735 b401 )
    ( on b722 b735 )
    ( on b55 b722 )
    ( on b262 b55 )
    ( on b105 b262 )
    ( on b930 b105 )
    ( on b12 b930 )
    ( on b119 b12 )
    ( on b897 b119 )
    ( on b956 b897 )
    ( on b1 b956 )
    ( on b815 b1 )
    ( on b676 b815 )
    ( on b389 b676 )
    ( on b740 b389 )
    ( on b472 b740 )
    ( on b898 b472 )
    ( on b518 b898 )
    ( on b57 b518 )
    ( on b701 b57 )
    ( on b748 b701 )
    ( on b307 b748 )
    ( on b514 b307 )
    ( clear b514 )
  )
  ( :goal
    ( and
      ( clear b707 )
    )
  )
)
