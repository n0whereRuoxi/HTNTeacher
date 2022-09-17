( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b625 - block
    b652 - block
    b944 - block
    b605 - block
    b900 - block
    b782 - block
    b731 - block
    b85 - block
    b430 - block
    b293 - block
    b185 - block
    b500 - block
    b443 - block
    b637 - block
    b67 - block
    b823 - block
    b554 - block
    b743 - block
    b952 - block
    b866 - block
    b988 - block
    b600 - block
    b6 - block
    b734 - block
    b610 - block
    b10 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b625 )
    ( on b652 b625 )
    ( on b944 b652 )
    ( on b605 b944 )
    ( on b900 b605 )
    ( on b782 b900 )
    ( on b731 b782 )
    ( on b85 b731 )
    ( on b430 b85 )
    ( on b293 b430 )
    ( on b185 b293 )
    ( on b500 b185 )
    ( on b443 b500 )
    ( on b637 b443 )
    ( on b67 b637 )
    ( on b823 b67 )
    ( on b554 b823 )
    ( on b743 b554 )
    ( on b952 b743 )
    ( on b866 b952 )
    ( on b988 b866 )
    ( on b600 b988 )
    ( on b6 b600 )
    ( on b734 b6 )
    ( on b610 b734 )
    ( on b10 b610 )
    ( clear b10 )
  )
  ( :goal
    ( and
      ( clear b625 )
    )
  )
)
