( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b516 - block
    b932 - block
    b14 - block
    b858 - block
    b113 - block
    b390 - block
    b698 - block
    b929 - block
    b669 - block
    b483 - block
    b267 - block
    b271 - block
    b546 - block
    b20 - block
    b440 - block
    b504 - block
    b394 - block
    b378 - block
    b934 - block
    b231 - block
    b109 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b516 )
    ( on b932 b516 )
    ( on b14 b932 )
    ( on b858 b14 )
    ( on b113 b858 )
    ( on b390 b113 )
    ( on b698 b390 )
    ( on b929 b698 )
    ( on b669 b929 )
    ( on b483 b669 )
    ( on b267 b483 )
    ( on b271 b267 )
    ( on b546 b271 )
    ( on b20 b546 )
    ( on b440 b20 )
    ( on b504 b440 )
    ( on b394 b504 )
    ( on b378 b394 )
    ( on b934 b378 )
    ( on b231 b934 )
    ( on b109 b231 )
    ( clear b109 )
  )
  ( :tasks
    ( Make-20Pile b932 b14 b858 b113 b390 b698 b929 b669 b483 b267 b271 b546 b20 b440 b504 b394 b378 b934 b231 b109 )
  )
)
