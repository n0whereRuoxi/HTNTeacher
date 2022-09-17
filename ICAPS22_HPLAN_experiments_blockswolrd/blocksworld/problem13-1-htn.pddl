( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b503 - block
    b45 - block
    b389 - block
    b228 - block
    b779 - block
    b324 - block
    b833 - block
    b602 - block
    b985 - block
    b150 - block
    b313 - block
    b581 - block
    b289 - block
    b48 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b503 )
    ( on b45 b503 )
    ( on b389 b45 )
    ( on b228 b389 )
    ( on b779 b228 )
    ( on b324 b779 )
    ( on b833 b324 )
    ( on b602 b833 )
    ( on b985 b602 )
    ( on b150 b985 )
    ( on b313 b150 )
    ( on b581 b313 )
    ( on b289 b581 )
    ( on b48 b289 )
    ( clear b48 )
  )
  ( :tasks
    ( Make-13Pile b45 b389 b228 b779 b324 b833 b602 b985 b150 b313 b581 b289 b48 )
  )
)
