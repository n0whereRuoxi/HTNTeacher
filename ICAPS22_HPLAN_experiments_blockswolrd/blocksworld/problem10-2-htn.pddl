( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b213 - block
    b274 - block
    b114 - block
    b602 - block
    b368 - block
    b426 - block
    b968 - block
    b361 - block
    b92 - block
    b13 - block
    b4 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b213 )
    ( on b274 b213 )
    ( on b114 b274 )
    ( on b602 b114 )
    ( on b368 b602 )
    ( on b426 b368 )
    ( on b968 b426 )
    ( on b361 b968 )
    ( on b92 b361 )
    ( on b13 b92 )
    ( on b4 b13 )
    ( clear b4 )
  )
  ( :tasks
    ( Make-10Pile b274 b114 b602 b368 b426 b968 b361 b92 b13 b4 )
  )
)
