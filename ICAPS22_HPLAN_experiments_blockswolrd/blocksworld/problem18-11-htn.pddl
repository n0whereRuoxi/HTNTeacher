( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b649 - block
    b625 - block
    b244 - block
    b554 - block
    b657 - block
    b66 - block
    b906 - block
    b454 - block
    b613 - block
    b136 - block
    b469 - block
    b400 - block
    b944 - block
    b466 - block
    b438 - block
    b92 - block
    b205 - block
    b606 - block
    b529 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b649 )
    ( on b625 b649 )
    ( on b244 b625 )
    ( on b554 b244 )
    ( on b657 b554 )
    ( on b66 b657 )
    ( on b906 b66 )
    ( on b454 b906 )
    ( on b613 b454 )
    ( on b136 b613 )
    ( on b469 b136 )
    ( on b400 b469 )
    ( on b944 b400 )
    ( on b466 b944 )
    ( on b438 b466 )
    ( on b92 b438 )
    ( on b205 b92 )
    ( on b606 b205 )
    ( on b529 b606 )
    ( clear b529 )
  )
  ( :tasks
    ( Make-18Pile b625 b244 b554 b657 b66 b906 b454 b613 b136 b469 b400 b944 b466 b438 b92 b205 b606 b529 )
  )
)
