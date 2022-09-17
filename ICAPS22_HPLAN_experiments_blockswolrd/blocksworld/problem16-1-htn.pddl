( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b683 - block
    b502 - block
    b429 - block
    b845 - block
    b366 - block
    b400 - block
    b858 - block
    b70 - block
    b236 - block
    b659 - block
    b764 - block
    b554 - block
    b826 - block
    b566 - block
    b485 - block
    b321 - block
    b489 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b683 )
    ( on b502 b683 )
    ( on b429 b502 )
    ( on b845 b429 )
    ( on b366 b845 )
    ( on b400 b366 )
    ( on b858 b400 )
    ( on b70 b858 )
    ( on b236 b70 )
    ( on b659 b236 )
    ( on b764 b659 )
    ( on b554 b764 )
    ( on b826 b554 )
    ( on b566 b826 )
    ( on b485 b566 )
    ( on b321 b485 )
    ( on b489 b321 )
    ( clear b489 )
  )
  ( :tasks
    ( Make-16Pile b502 b429 b845 b366 b400 b858 b70 b236 b659 b764 b554 b826 b566 b485 b321 b489 )
  )
)
