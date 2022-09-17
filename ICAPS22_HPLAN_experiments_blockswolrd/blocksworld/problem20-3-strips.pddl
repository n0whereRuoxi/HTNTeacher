( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b967 - block
    b801 - block
    b481 - block
    b826 - block
    b448 - block
    b720 - block
    b576 - block
    b500 - block
    b245 - block
    b673 - block
    b949 - block
    b866 - block
    b464 - block
    b116 - block
    b798 - block
    b873 - block
    b937 - block
    b635 - block
    b274 - block
    b585 - block
    b797 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b967 )
    ( on b801 b967 )
    ( on b481 b801 )
    ( on b826 b481 )
    ( on b448 b826 )
    ( on b720 b448 )
    ( on b576 b720 )
    ( on b500 b576 )
    ( on b245 b500 )
    ( on b673 b245 )
    ( on b949 b673 )
    ( on b866 b949 )
    ( on b464 b866 )
    ( on b116 b464 )
    ( on b798 b116 )
    ( on b873 b798 )
    ( on b937 b873 )
    ( on b635 b937 )
    ( on b274 b635 )
    ( on b585 b274 )
    ( on b797 b585 )
    ( clear b797 )
  )
  ( :goal
    ( and
      ( clear b967 )
    )
  )
)
