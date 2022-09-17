( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b592 - block
    b192 - block
    b526 - block
    b504 - block
    b684 - block
    b832 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b592 )
    ( on b192 b592 )
    ( on b526 b192 )
    ( on b504 b526 )
    ( on b684 b504 )
    ( on b832 b684 )
    ( clear b832 )
  )
  ( :tasks
    ( Make-5Pile b192 b526 b504 b684 b832 )
  )
)
