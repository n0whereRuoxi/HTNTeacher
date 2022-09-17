( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b911 - block
    b237 - block
    b275 - block
    b394 - block
    b132 - block
    b430 - block
    b463 - block
    b105 - block
    b189 - block
    b527 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b911 )
    ( on b237 b911 )
    ( on b275 b237 )
    ( on b394 b275 )
    ( on b132 b394 )
    ( on b430 b132 )
    ( on b463 b430 )
    ( on b105 b463 )
    ( on b189 b105 )
    ( on b527 b189 )
    ( clear b527 )
  )
  ( :tasks
    ( Make-9Pile b237 b275 b394 b132 b430 b463 b105 b189 b527 )
  )
)
