( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
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
  ( :goal
    ( and
      ( clear b592 )
    )
  )
)
