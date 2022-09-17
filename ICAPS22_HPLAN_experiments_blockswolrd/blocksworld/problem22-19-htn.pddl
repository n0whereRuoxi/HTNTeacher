( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b220 - block
    b763 - block
    b398 - block
    b378 - block
    b381 - block
    b646 - block
    b768 - block
    b900 - block
    b588 - block
    b10 - block
    b622 - block
    b697 - block
    b776 - block
    b864 - block
    b99 - block
    b627 - block
    b369 - block
    b15 - block
    b245 - block
    b339 - block
    b637 - block
    b712 - block
    b541 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b220 )
    ( on b763 b220 )
    ( on b398 b763 )
    ( on b378 b398 )
    ( on b381 b378 )
    ( on b646 b381 )
    ( on b768 b646 )
    ( on b900 b768 )
    ( on b588 b900 )
    ( on b10 b588 )
    ( on b622 b10 )
    ( on b697 b622 )
    ( on b776 b697 )
    ( on b864 b776 )
    ( on b99 b864 )
    ( on b627 b99 )
    ( on b369 b627 )
    ( on b15 b369 )
    ( on b245 b15 )
    ( on b339 b245 )
    ( on b637 b339 )
    ( on b712 b637 )
    ( on b541 b712 )
    ( clear b541 )
  )
  ( :tasks
    ( Make-22Pile b763 b398 b378 b381 b646 b768 b900 b588 b10 b622 b697 b776 b864 b99 b627 b369 b15 b245 b339 b637 b712 b541 )
  )
)
