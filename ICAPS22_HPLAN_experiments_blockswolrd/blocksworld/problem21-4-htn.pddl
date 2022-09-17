( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b420 - block
    b250 - block
    b499 - block
    b333 - block
    b89 - block
    b688 - block
    b524 - block
    b37 - block
    b966 - block
    b826 - block
    b449 - block
    b363 - block
    b74 - block
    b241 - block
    b876 - block
    b407 - block
    b376 - block
    b390 - block
    b763 - block
    b872 - block
    b341 - block
    b158 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b420 )
    ( on b250 b420 )
    ( on b499 b250 )
    ( on b333 b499 )
    ( on b89 b333 )
    ( on b688 b89 )
    ( on b524 b688 )
    ( on b37 b524 )
    ( on b966 b37 )
    ( on b826 b966 )
    ( on b449 b826 )
    ( on b363 b449 )
    ( on b74 b363 )
    ( on b241 b74 )
    ( on b876 b241 )
    ( on b407 b876 )
    ( on b376 b407 )
    ( on b390 b376 )
    ( on b763 b390 )
    ( on b872 b763 )
    ( on b341 b872 )
    ( on b158 b341 )
    ( clear b158 )
  )
  ( :tasks
    ( Make-21Pile b250 b499 b333 b89 b688 b524 b37 b966 b826 b449 b363 b74 b241 b876 b407 b376 b390 b763 b872 b341 b158 )
  )
)
