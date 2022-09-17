( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b801 - block
    b651 - block
    b720 - block
    b825 - block
    b334 - block
    b852 - block
    b38 - block
    b292 - block
    b789 - block
    b52 - block
    b767 - block
    b653 - block
    b311 - block
    b370 - block
    b46 - block
    b477 - block
    b514 - block
    b595 - block
    b9 - block
    b577 - block
    b197 - block
    b697 - block
    b719 - block
    b109 - block
    b982 - block
    b265 - block
    b93 - block
    b924 - block
    b851 - block
    b944 - block
    b792 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b801 )
    ( on b651 b801 )
    ( on b720 b651 )
    ( on b825 b720 )
    ( on b334 b825 )
    ( on b852 b334 )
    ( on b38 b852 )
    ( on b292 b38 )
    ( on b789 b292 )
    ( on b52 b789 )
    ( on b767 b52 )
    ( on b653 b767 )
    ( on b311 b653 )
    ( on b370 b311 )
    ( on b46 b370 )
    ( on b477 b46 )
    ( on b514 b477 )
    ( on b595 b514 )
    ( on b9 b595 )
    ( on b577 b9 )
    ( on b197 b577 )
    ( on b697 b197 )
    ( on b719 b697 )
    ( on b109 b719 )
    ( on b982 b109 )
    ( on b265 b982 )
    ( on b93 b265 )
    ( on b924 b93 )
    ( on b851 b924 )
    ( on b944 b851 )
    ( on b792 b944 )
    ( clear b792 )
  )
  ( :goal
    ( and
      ( clear b801 )
    )
  )
)
