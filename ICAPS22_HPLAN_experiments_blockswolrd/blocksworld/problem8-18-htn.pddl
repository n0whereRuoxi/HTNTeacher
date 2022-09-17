( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b38 - block
    b829 - block
    b197 - block
    b670 - block
    b106 - block
    b892 - block
    b168 - block
    b677 - block
    b355 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b38 )
    ( on b829 b38 )
    ( on b197 b829 )
    ( on b670 b197 )
    ( on b106 b670 )
    ( on b892 b106 )
    ( on b168 b892 )
    ( on b677 b168 )
    ( on b355 b677 )
    ( clear b355 )
  )
  ( :tasks
    ( Make-8Pile b829 b197 b670 b106 b892 b168 b677 b355 )
  )
)
