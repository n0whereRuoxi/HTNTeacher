( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b298 - block
    b289 - block
    b569 - block
    b385 - block
    b315 - block
    b450 - block
    b456 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b298 )
    ( on b289 b298 )
    ( on b569 b289 )
    ( on b385 b569 )
    ( on b315 b385 )
    ( on b450 b315 )
    ( on b456 b450 )
    ( clear b456 )
  )
  ( :tasks
    ( Make-6Pile b289 b569 b385 b315 b450 b456 )
  )
)
