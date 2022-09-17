( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b630 - block
    b502 - block
    b487 - block
    b257 - block
    b955 - block
    b405 - block
    b602 - block
    b151 - block
    b505 - block
    b693 - block
    b959 - block
    b78 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b630 )
    ( on b502 b630 )
    ( on b487 b502 )
    ( on b257 b487 )
    ( on b955 b257 )
    ( on b405 b955 )
    ( on b602 b405 )
    ( on b151 b602 )
    ( on b505 b151 )
    ( on b693 b505 )
    ( on b959 b693 )
    ( on b78 b959 )
    ( clear b78 )
  )
  ( :tasks
    ( Make-11Pile b502 b487 b257 b955 b405 b602 b151 b505 b693 b959 b78 )
  )
)
