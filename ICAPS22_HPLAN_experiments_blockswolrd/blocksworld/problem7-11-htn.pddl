( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b74 - block
    b610 - block
    b40 - block
    b347 - block
    b752 - block
    b594 - block
    b602 - block
    b979 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b74 )
    ( on b610 b74 )
    ( on b40 b610 )
    ( on b347 b40 )
    ( on b752 b347 )
    ( on b594 b752 )
    ( on b602 b594 )
    ( on b979 b602 )
    ( clear b979 )
  )
  ( :tasks
    ( Make-7Pile b610 b40 b347 b752 b594 b602 b979 )
  )
)
