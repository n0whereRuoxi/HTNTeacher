( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b348 - block
    b43 - block
    b257 - block
    b155 - block
    b600 - block
    b119 - block
    b621 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b348 )
    ( on b43 b348 )
    ( on b257 b43 )
    ( on b155 b257 )
    ( on b600 b155 )
    ( on b119 b600 )
    ( on b621 b119 )
    ( clear b621 )
  )
  ( :tasks
    ( Make-6Pile b43 b257 b155 b600 b119 b621 )
  )
)
