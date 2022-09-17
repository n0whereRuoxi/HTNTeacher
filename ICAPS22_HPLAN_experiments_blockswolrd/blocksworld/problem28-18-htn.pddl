( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b173 - block
    b968 - block
    b399 - block
    b83 - block
    b745 - block
    b593 - block
    b883 - block
    b480 - block
    b133 - block
    b16 - block
    b92 - block
    b764 - block
    b882 - block
    b769 - block
    b810 - block
    b103 - block
    b132 - block
    b812 - block
    b38 - block
    b159 - block
    b510 - block
    b178 - block
    b788 - block
    b942 - block
    b486 - block
    b979 - block
    b392 - block
    b970 - block
    b44 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b173 )
    ( on b968 b173 )
    ( on b399 b968 )
    ( on b83 b399 )
    ( on b745 b83 )
    ( on b593 b745 )
    ( on b883 b593 )
    ( on b480 b883 )
    ( on b133 b480 )
    ( on b16 b133 )
    ( on b92 b16 )
    ( on b764 b92 )
    ( on b882 b764 )
    ( on b769 b882 )
    ( on b810 b769 )
    ( on b103 b810 )
    ( on b132 b103 )
    ( on b812 b132 )
    ( on b38 b812 )
    ( on b159 b38 )
    ( on b510 b159 )
    ( on b178 b510 )
    ( on b788 b178 )
    ( on b942 b788 )
    ( on b486 b942 )
    ( on b979 b486 )
    ( on b392 b979 )
    ( on b970 b392 )
    ( on b44 b970 )
    ( clear b44 )
  )
  ( :tasks
    ( Make-28Pile b968 b399 b83 b745 b593 b883 b480 b133 b16 b92 b764 b882 b769 b810 b103 b132 b812 b38 b159 b510 b178 b788 b942 b486 b979 b392 b970 b44 )
  )
)
