( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b874 - block
    b715 - block
    b983 - block
    b861 - block
    b92 - block
    b578 - block
    b504 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b874 )
    ( on b715 b874 )
    ( on b983 b715 )
    ( on b861 b983 )
    ( on b92 b861 )
    ( on b578 b92 )
    ( on b504 b578 )
    ( clear b504 )
  )
  ( :goal
    ( and
      ( clear b874 )
    )
  )
)