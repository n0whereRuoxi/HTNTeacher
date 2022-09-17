( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b768 - block
    b467 - block
    b335 - block
    b809 - block
    b840 - block
    b423 - block
    b200 - block
    b434 - block
    b240 - block
    b152 - block
    b327 - block
    b579 - block
    b448 - block
    b982 - block
    b289 - block
    b831 - block
    b293 - block
    b485 - block
    b218 - block
    b208 - block
    b376 - block
    b492 - block
    b692 - block
    b221 - block
    b349 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b768 )
    ( on b467 b768 )
    ( on b335 b467 )
    ( on b809 b335 )
    ( on b840 b809 )
    ( on b423 b840 )
    ( on b200 b423 )
    ( on b434 b200 )
    ( on b240 b434 )
    ( on b152 b240 )
    ( on b327 b152 )
    ( on b579 b327 )
    ( on b448 b579 )
    ( on b982 b448 )
    ( on b289 b982 )
    ( on b831 b289 )
    ( on b293 b831 )
    ( on b485 b293 )
    ( on b218 b485 )
    ( on b208 b218 )
    ( on b376 b208 )
    ( on b492 b376 )
    ( on b692 b492 )
    ( on b221 b692 )
    ( on b349 b221 )
    ( on b381 b349 )
    ( clear b381 )
  )
  ( :tasks
    ( Make-25Pile b467 b335 b809 b840 b423 b200 b434 b240 b152 b327 b579 b448 b982 b289 b831 b293 b485 b218 b208 b376 b492 b692 b221 b349 b381 )
  )
)
