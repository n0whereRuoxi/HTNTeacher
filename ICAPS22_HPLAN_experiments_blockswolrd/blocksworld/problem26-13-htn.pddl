( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b465 - block
    b648 - block
    b256 - block
    b321 - block
    b200 - block
    b245 - block
    b526 - block
    b803 - block
    b604 - block
    b219 - block
    b849 - block
    b495 - block
    b138 - block
    b583 - block
    b32 - block
    b594 - block
    b471 - block
    b160 - block
    b838 - block
    b611 - block
    b777 - block
    b119 - block
    b489 - block
    b55 - block
    b894 - block
    b350 - block
    b728 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b465 )
    ( on b648 b465 )
    ( on b256 b648 )
    ( on b321 b256 )
    ( on b200 b321 )
    ( on b245 b200 )
    ( on b526 b245 )
    ( on b803 b526 )
    ( on b604 b803 )
    ( on b219 b604 )
    ( on b849 b219 )
    ( on b495 b849 )
    ( on b138 b495 )
    ( on b583 b138 )
    ( on b32 b583 )
    ( on b594 b32 )
    ( on b471 b594 )
    ( on b160 b471 )
    ( on b838 b160 )
    ( on b611 b838 )
    ( on b777 b611 )
    ( on b119 b777 )
    ( on b489 b119 )
    ( on b55 b489 )
    ( on b894 b55 )
    ( on b350 b894 )
    ( on b728 b350 )
    ( clear b728 )
  )
  ( :tasks
    ( Make-26Pile b648 b256 b321 b200 b245 b526 b803 b604 b219 b849 b495 b138 b583 b32 b594 b471 b160 b838 b611 b777 b119 b489 b55 b894 b350 b728 )
  )
)
