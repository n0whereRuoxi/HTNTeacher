( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b498 - block
    b308 - block
    b421 - block
    b507 - block
    b117 - block
    b51 - block
    b581 - block
    b721 - block
    b108 - block
    b365 - block
    b357 - block
    b972 - block
    b526 - block
    b422 - block
    b459 - block
    b149 - block
    b58 - block
    b74 - block
    b791 - block
    b530 - block
    b402 - block
    b674 - block
    b905 - block
    b997 - block
    b768 - block
    b737 - block
    b946 - block
    b966 - block
    b383 - block
    b956 - block
    b755 - block
    b432 - block
    b565 - block
    b968 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b498 )
    ( on b308 b498 )
    ( on b421 b308 )
    ( on b507 b421 )
    ( on b117 b507 )
    ( on b51 b117 )
    ( on b581 b51 )
    ( on b721 b581 )
    ( on b108 b721 )
    ( on b365 b108 )
    ( on b357 b365 )
    ( on b972 b357 )
    ( on b526 b972 )
    ( on b422 b526 )
    ( on b459 b422 )
    ( on b149 b459 )
    ( on b58 b149 )
    ( on b74 b58 )
    ( on b791 b74 )
    ( on b530 b791 )
    ( on b402 b530 )
    ( on b674 b402 )
    ( on b905 b674 )
    ( on b997 b905 )
    ( on b768 b997 )
    ( on b737 b768 )
    ( on b946 b737 )
    ( on b966 b946 )
    ( on b383 b966 )
    ( on b956 b383 )
    ( on b755 b956 )
    ( on b432 b755 )
    ( on b565 b432 )
    ( on b968 b565 )
    ( clear b968 )
  )
  ( :tasks
    ( Make-33Pile b308 b421 b507 b117 b51 b581 b721 b108 b365 b357 b972 b526 b422 b459 b149 b58 b74 b791 b530 b402 b674 b905 b997 b768 b737 b946 b966 b383 b956 b755 b432 b565 b968 )
  )
)
