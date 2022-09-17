( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b98 - block
    b27 - block
    b932 - block
    b84 - block
    b607 - block
    b690 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b98 )
    ( on b27 b98 )
    ( on b932 b27 )
    ( on b84 b932 )
    ( on b607 b84 )
    ( on b690 b607 )
    ( clear b690 )
  )
  ( :tasks
    ( Make-5Pile b27 b932 b84 b607 b690 )
  )
)
