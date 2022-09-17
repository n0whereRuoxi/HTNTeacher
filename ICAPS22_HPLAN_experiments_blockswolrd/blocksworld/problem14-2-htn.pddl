( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b627 - block
    b399 - block
    b809 - block
    b586 - block
    b941 - block
    b946 - block
    b314 - block
    b525 - block
    b74 - block
    b782 - block
    b765 - block
    b628 - block
    b257 - block
    b742 - block
    b315 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b627 )
    ( on b399 b627 )
    ( on b809 b399 )
    ( on b586 b809 )
    ( on b941 b586 )
    ( on b946 b941 )
    ( on b314 b946 )
    ( on b525 b314 )
    ( on b74 b525 )
    ( on b782 b74 )
    ( on b765 b782 )
    ( on b628 b765 )
    ( on b257 b628 )
    ( on b742 b257 )
    ( on b315 b742 )
    ( clear b315 )
  )
  ( :tasks
    ( Make-14Pile b399 b809 b586 b941 b946 b314 b525 b74 b782 b765 b628 b257 b742 b315 )
  )
)
