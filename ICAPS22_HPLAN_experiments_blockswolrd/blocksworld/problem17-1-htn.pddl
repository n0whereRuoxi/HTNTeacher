( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b172 - block
    b311 - block
    b968 - block
    b233 - block
    b573 - block
    b364 - block
    b38 - block
    b320 - block
    b427 - block
    b765 - block
    b293 - block
    b880 - block
    b911 - block
    b565 - block
    b545 - block
    b116 - block
    b223 - block
    b650 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b172 )
    ( on b311 b172 )
    ( on b968 b311 )
    ( on b233 b968 )
    ( on b573 b233 )
    ( on b364 b573 )
    ( on b38 b364 )
    ( on b320 b38 )
    ( on b427 b320 )
    ( on b765 b427 )
    ( on b293 b765 )
    ( on b880 b293 )
    ( on b911 b880 )
    ( on b565 b911 )
    ( on b545 b565 )
    ( on b116 b545 )
    ( on b223 b116 )
    ( on b650 b223 )
    ( clear b650 )
  )
  ( :tasks
    ( Make-17Pile b311 b968 b233 b573 b364 b38 b320 b427 b765 b293 b880 b911 b565 b545 b116 b223 b650 )
  )
)
