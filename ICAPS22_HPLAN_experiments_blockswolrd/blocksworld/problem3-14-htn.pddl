( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b257 - block
    b665 - block
    b721 - block
    b767 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b257 )
    ( on b665 b257 )
    ( on b721 b665 )
    ( on b767 b721 )
    ( clear b767 )
  )
  ( :tasks
    ( Make-3Pile b665 b721 b767 )
  )
)
