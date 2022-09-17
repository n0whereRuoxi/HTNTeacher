( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b656 - block
    b876 - block
    b751 - block
    b4 - block
    b805 - block
    b74 - block
    b771 - block
    b682 - block
    b757 - block
    b746 - block
    b829 - block
    b654 - block
    b121 - block
    b429 - block
    b619 - block
    b246 - block
    b398 - block
    b440 - block
    b691 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b656 )
    ( on b876 b656 )
    ( on b751 b876 )
    ( on b4 b751 )
    ( on b805 b4 )
    ( on b74 b805 )
    ( on b771 b74 )
    ( on b682 b771 )
    ( on b757 b682 )
    ( on b746 b757 )
    ( on b829 b746 )
    ( on b654 b829 )
    ( on b121 b654 )
    ( on b429 b121 )
    ( on b619 b429 )
    ( on b246 b619 )
    ( on b398 b246 )
    ( on b440 b398 )
    ( on b691 b440 )
    ( clear b691 )
  )
  ( :tasks
    ( Make-18Pile b876 b751 b4 b805 b74 b771 b682 b757 b746 b829 b654 b121 b429 b619 b246 b398 b440 b691 )
  )
)
