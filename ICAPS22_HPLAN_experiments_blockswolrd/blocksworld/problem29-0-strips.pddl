( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b349 - block
    b147 - block
    b682 - block
    b14 - block
    b590 - block
    b258 - block
    b11 - block
    b325 - block
    b18 - block
    b721 - block
    b836 - block
    b124 - block
    b998 - block
    b901 - block
    b342 - block
    b654 - block
    b89 - block
    b499 - block
    b982 - block
    b192 - block
    b878 - block
    b789 - block
    b708 - block
    b145 - block
    b92 - block
    b472 - block
    b102 - block
    b898 - block
    b46 - block
    b223 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b349 )
    ( on b147 b349 )
    ( on b682 b147 )
    ( on b14 b682 )
    ( on b590 b14 )
    ( on b258 b590 )
    ( on b11 b258 )
    ( on b325 b11 )
    ( on b18 b325 )
    ( on b721 b18 )
    ( on b836 b721 )
    ( on b124 b836 )
    ( on b998 b124 )
    ( on b901 b998 )
    ( on b342 b901 )
    ( on b654 b342 )
    ( on b89 b654 )
    ( on b499 b89 )
    ( on b982 b499 )
    ( on b192 b982 )
    ( on b878 b192 )
    ( on b789 b878 )
    ( on b708 b789 )
    ( on b145 b708 )
    ( on b92 b145 )
    ( on b472 b92 )
    ( on b102 b472 )
    ( on b898 b102 )
    ( on b46 b898 )
    ( on b223 b46 )
    ( clear b223 )
  )
  ( :goal
    ( and
      ( clear b349 )
    )
  )
)
