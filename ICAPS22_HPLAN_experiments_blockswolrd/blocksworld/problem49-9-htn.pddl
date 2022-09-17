( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b777 - block
    b145 - block
    b958 - block
    b954 - block
    b404 - block
    b658 - block
    b160 - block
    b88 - block
    b157 - block
    b488 - block
    b276 - block
    b156 - block
    b881 - block
    b94 - block
    b313 - block
    b980 - block
    b233 - block
    b43 - block
    b122 - block
    b178 - block
    b889 - block
    b132 - block
    b865 - block
    b228 - block
    b994 - block
    b364 - block
    b166 - block
    b754 - block
    b159 - block
    b14 - block
    b570 - block
    b179 - block
    b584 - block
    b808 - block
    b357 - block
    b817 - block
    b581 - block
    b420 - block
    b824 - block
    b907 - block
    b246 - block
    b583 - block
    b586 - block
    b631 - block
    b421 - block
    b213 - block
    b346 - block
    b539 - block
    b530 - block
    b22 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b777 )
    ( on b145 b777 )
    ( on b958 b145 )
    ( on b954 b958 )
    ( on b404 b954 )
    ( on b658 b404 )
    ( on b160 b658 )
    ( on b88 b160 )
    ( on b157 b88 )
    ( on b488 b157 )
    ( on b276 b488 )
    ( on b156 b276 )
    ( on b881 b156 )
    ( on b94 b881 )
    ( on b313 b94 )
    ( on b980 b313 )
    ( on b233 b980 )
    ( on b43 b233 )
    ( on b122 b43 )
    ( on b178 b122 )
    ( on b889 b178 )
    ( on b132 b889 )
    ( on b865 b132 )
    ( on b228 b865 )
    ( on b994 b228 )
    ( on b364 b994 )
    ( on b166 b364 )
    ( on b754 b166 )
    ( on b159 b754 )
    ( on b14 b159 )
    ( on b570 b14 )
    ( on b179 b570 )
    ( on b584 b179 )
    ( on b808 b584 )
    ( on b357 b808 )
    ( on b817 b357 )
    ( on b581 b817 )
    ( on b420 b581 )
    ( on b824 b420 )
    ( on b907 b824 )
    ( on b246 b907 )
    ( on b583 b246 )
    ( on b586 b583 )
    ( on b631 b586 )
    ( on b421 b631 )
    ( on b213 b421 )
    ( on b346 b213 )
    ( on b539 b346 )
    ( on b530 b539 )
    ( on b22 b530 )
    ( clear b22 )
  )
  ( :tasks
    ( Make-49Pile b145 b958 b954 b404 b658 b160 b88 b157 b488 b276 b156 b881 b94 b313 b980 b233 b43 b122 b178 b889 b132 b865 b228 b994 b364 b166 b754 b159 b14 b570 b179 b584 b808 b357 b817 b581 b420 b824 b907 b246 b583 b586 b631 b421 b213 b346 b539 b530 b22 )
  )
)
