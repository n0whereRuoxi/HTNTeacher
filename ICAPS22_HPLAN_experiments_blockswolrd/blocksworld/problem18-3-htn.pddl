( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b898 - block
    b503 - block
    b985 - block
    b910 - block
    b246 - block
    b888 - block
    b129 - block
    b283 - block
    b231 - block
    b902 - block
    b882 - block
    b183 - block
    b692 - block
    b469 - block
    b568 - block
    b461 - block
    b357 - block
    b219 - block
    b157 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b898 )
    ( on b503 b898 )
    ( on b985 b503 )
    ( on b910 b985 )
    ( on b246 b910 )
    ( on b888 b246 )
    ( on b129 b888 )
    ( on b283 b129 )
    ( on b231 b283 )
    ( on b902 b231 )
    ( on b882 b902 )
    ( on b183 b882 )
    ( on b692 b183 )
    ( on b469 b692 )
    ( on b568 b469 )
    ( on b461 b568 )
    ( on b357 b461 )
    ( on b219 b357 )
    ( on b157 b219 )
    ( clear b157 )
  )
  ( :tasks
    ( Make-18Pile b503 b985 b910 b246 b888 b129 b283 b231 b902 b882 b183 b692 b469 b568 b461 b357 b219 b157 )
  )
)
