( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b208 - block
    b573 - block
    b540 - block
    b717 - block
    b560 - block
    b683 - block
    b775 - block
    b334 - block
    b190 - block
    b744 - block
    b594 - block
    b961 - block
    b973 - block
    b561 - block
    b897 - block
    b320 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b208 )
    ( on b573 b208 )
    ( on b540 b573 )
    ( on b717 b540 )
    ( on b560 b717 )
    ( on b683 b560 )
    ( on b775 b683 )
    ( on b334 b775 )
    ( on b190 b334 )
    ( on b744 b190 )
    ( on b594 b744 )
    ( on b961 b594 )
    ( on b973 b961 )
    ( on b561 b973 )
    ( on b897 b561 )
    ( on b320 b897 )
    ( clear b320 )
  )
  ( :tasks
    ( Make-15Pile b573 b540 b717 b560 b683 b775 b334 b190 b744 b594 b961 b973 b561 b897 b320 )
  )
)
