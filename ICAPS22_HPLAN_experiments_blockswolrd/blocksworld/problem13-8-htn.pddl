( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b271 - block
    b715 - block
    b314 - block
    b114 - block
    b184 - block
    b524 - block
    b980 - block
    b202 - block
    b122 - block
    b701 - block
    b309 - block
    b53 - block
    b429 - block
    b962 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b271 )
    ( on b715 b271 )
    ( on b314 b715 )
    ( on b114 b314 )
    ( on b184 b114 )
    ( on b524 b184 )
    ( on b980 b524 )
    ( on b202 b980 )
    ( on b122 b202 )
    ( on b701 b122 )
    ( on b309 b701 )
    ( on b53 b309 )
    ( on b429 b53 )
    ( on b962 b429 )
    ( clear b962 )
  )
  ( :tasks
    ( Make-13Pile b715 b314 b114 b184 b524 b980 b202 b122 b701 b309 b53 b429 b962 )
  )
)
