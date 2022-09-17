( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b116 - block
    b869 - block
    b167 - block
    b335 - block
    b309 - block
    b137 - block
    b823 - block
    b548 - block
    b522 - block
    b297 - block
    b756 - block
    b572 - block
    b500 - block
    b325 - block
    b337 - block
    b788 - block
    b24 - block
    b130 - block
    b829 - block
    b291 - block
    b927 - block
    b787 - block
    b171 - block
    b101 - block
    b134 - block
    b143 - block
    b800 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b116 )
    ( on b869 b116 )
    ( on b167 b869 )
    ( on b335 b167 )
    ( on b309 b335 )
    ( on b137 b309 )
    ( on b823 b137 )
    ( on b548 b823 )
    ( on b522 b548 )
    ( on b297 b522 )
    ( on b756 b297 )
    ( on b572 b756 )
    ( on b500 b572 )
    ( on b325 b500 )
    ( on b337 b325 )
    ( on b788 b337 )
    ( on b24 b788 )
    ( on b130 b24 )
    ( on b829 b130 )
    ( on b291 b829 )
    ( on b927 b291 )
    ( on b787 b927 )
    ( on b171 b787 )
    ( on b101 b171 )
    ( on b134 b101 )
    ( on b143 b134 )
    ( on b800 b143 )
    ( clear b800 )
  )
  ( :tasks
    ( Make-26Pile b869 b167 b335 b309 b137 b823 b548 b522 b297 b756 b572 b500 b325 b337 b788 b24 b130 b829 b291 b927 b787 b171 b101 b134 b143 b800 )
  )
)
