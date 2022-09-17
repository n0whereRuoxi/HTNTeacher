( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b356 - block
    b539 - block
    b715 - block
    b839 - block
    b76 - block
    b634 - block
    b894 - block
    b238 - block
    b767 - block
    b856 - block
    b475 - block
    b92 - block
    b925 - block
    b964 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b356 )
    ( on b539 b356 )
    ( on b715 b539 )
    ( on b839 b715 )
    ( on b76 b839 )
    ( on b634 b76 )
    ( on b894 b634 )
    ( on b238 b894 )
    ( on b767 b238 )
    ( on b856 b767 )
    ( on b475 b856 )
    ( on b92 b475 )
    ( on b925 b92 )
    ( on b964 b925 )
    ( clear b964 )
  )
  ( :tasks
    ( Make-13Pile b539 b715 b839 b76 b634 b894 b238 b767 b856 b475 b92 b925 b964 )
  )
)
