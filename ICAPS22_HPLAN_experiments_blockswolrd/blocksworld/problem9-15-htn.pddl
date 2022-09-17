( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b427 - block
    b388 - block
    b739 - block
    b240 - block
    b86 - block
    b312 - block
    b271 - block
    b566 - block
    b404 - block
    b133 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b427 )
    ( on b388 b427 )
    ( on b739 b388 )
    ( on b240 b739 )
    ( on b86 b240 )
    ( on b312 b86 )
    ( on b271 b312 )
    ( on b566 b271 )
    ( on b404 b566 )
    ( on b133 b404 )
    ( clear b133 )
  )
  ( :tasks
    ( Make-9Pile b388 b739 b240 b86 b312 b271 b566 b404 b133 )
  )
)
