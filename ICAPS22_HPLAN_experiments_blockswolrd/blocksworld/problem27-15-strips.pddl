( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b891 - block
    b426 - block
    b759 - block
    b150 - block
    b767 - block
    b106 - block
    b615 - block
    b257 - block
    b569 - block
    b113 - block
    b799 - block
    b329 - block
    b689 - block
    b82 - block
    b189 - block
    b470 - block
    b394 - block
    b997 - block
    b594 - block
    b56 - block
    b218 - block
    b892 - block
    b773 - block
    b630 - block
    b263 - block
    b264 - block
    b663 - block
    b797 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b891 )
    ( on b426 b891 )
    ( on b759 b426 )
    ( on b150 b759 )
    ( on b767 b150 )
    ( on b106 b767 )
    ( on b615 b106 )
    ( on b257 b615 )
    ( on b569 b257 )
    ( on b113 b569 )
    ( on b799 b113 )
    ( on b329 b799 )
    ( on b689 b329 )
    ( on b82 b689 )
    ( on b189 b82 )
    ( on b470 b189 )
    ( on b394 b470 )
    ( on b997 b394 )
    ( on b594 b997 )
    ( on b56 b594 )
    ( on b218 b56 )
    ( on b892 b218 )
    ( on b773 b892 )
    ( on b630 b773 )
    ( on b263 b630 )
    ( on b264 b263 )
    ( on b663 b264 )
    ( on b797 b663 )
    ( clear b797 )
  )
  ( :goal
    ( and
      ( clear b891 )
    )
  )
)
