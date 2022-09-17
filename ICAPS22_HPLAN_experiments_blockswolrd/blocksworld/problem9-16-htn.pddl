( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b69 - block
    b378 - block
    b245 - block
    b363 - block
    b650 - block
    b24 - block
    b353 - block
    b695 - block
    b729 - block
    b355 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b69 )
    ( on b378 b69 )
    ( on b245 b378 )
    ( on b363 b245 )
    ( on b650 b363 )
    ( on b24 b650 )
    ( on b353 b24 )
    ( on b695 b353 )
    ( on b729 b695 )
    ( on b355 b729 )
    ( clear b355 )
  )
  ( :tasks
    ( Make-9Pile b378 b245 b363 b650 b24 b353 b695 b729 b355 )
  )
)
