( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b771 - block
    b930 - block
    b714 - block
    b874 - block
    b809 - block
    b731 - block
    b910 - block
    b27 - block
    b948 - block
    b413 - block
    b921 - block
    b186 - block
    b977 - block
    b51 - block
    b99 - block
    b637 - block
    b310 - block
    b633 - block
    b429 - block
    b591 - block
    b378 - block
    b85 - block
    b4 - block
    b600 - block
    b656 - block
    b338 - block
    b990 - block
    b897 - block
    b162 - block
    b321 - block
    b66 - block
    b281 - block
    b719 - block
    b300 - block
    b576 - block
    b850 - block
    b533 - block
    b625 - block
    b529 - block
    b381 - block
    b374 - block
    b604 - block
    b654 - block
    b597 - block
    b644 - block
    b700 - block
    b570 - block
    b247 - block
    b154 - block
    b686 - block
    b608 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b771 )
    ( on b930 b771 )
    ( on b714 b930 )
    ( on b874 b714 )
    ( on b809 b874 )
    ( on b731 b809 )
    ( on b910 b731 )
    ( on b27 b910 )
    ( on b948 b27 )
    ( on b413 b948 )
    ( on b921 b413 )
    ( on b186 b921 )
    ( on b977 b186 )
    ( on b51 b977 )
    ( on b99 b51 )
    ( on b637 b99 )
    ( on b310 b637 )
    ( on b633 b310 )
    ( on b429 b633 )
    ( on b591 b429 )
    ( on b378 b591 )
    ( on b85 b378 )
    ( on b4 b85 )
    ( on b600 b4 )
    ( on b656 b600 )
    ( on b338 b656 )
    ( on b990 b338 )
    ( on b897 b990 )
    ( on b162 b897 )
    ( on b321 b162 )
    ( on b66 b321 )
    ( on b281 b66 )
    ( on b719 b281 )
    ( on b300 b719 )
    ( on b576 b300 )
    ( on b850 b576 )
    ( on b533 b850 )
    ( on b625 b533 )
    ( on b529 b625 )
    ( on b381 b529 )
    ( on b374 b381 )
    ( on b604 b374 )
    ( on b654 b604 )
    ( on b597 b654 )
    ( on b644 b597 )
    ( on b700 b644 )
    ( on b570 b700 )
    ( on b247 b570 )
    ( on b154 b247 )
    ( on b686 b154 )
    ( on b608 b686 )
    ( clear b608 )
  )
  ( :goal
    ( and
      ( clear b771 )
    )
  )
)
