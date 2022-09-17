( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b211 - block
    b119 - block
    b31 - block
    b240 - block
    b792 - block
    b650 - block
    b343 - block
    b474 - block
    b292 - block
    b130 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b211 )
    ( on b119 b211 )
    ( on b31 b119 )
    ( on b240 b31 )
    ( on b792 b240 )
    ( on b650 b792 )
    ( on b343 b650 )
    ( on b474 b343 )
    ( on b292 b474 )
    ( on b130 b292 )
    ( clear b130 )
  )
  ( :tasks
    ( Make-9Pile b119 b31 b240 b792 b650 b343 b474 b292 b130 )
  )
)
