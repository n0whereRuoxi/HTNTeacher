( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b441 - block
    b133 - block
    b95 - block
    b203 - block
    b881 - block
    b211 - block
    b101 - block
    b199 - block
    b321 - block
    b71 - block
    b23 - block
    b659 - block
    b634 - block
    b912 - block
    b244 - block
    b303 - block
    b420 - block
    b404 - block
    b402 - block
    b665 - block
    b456 - block
    b689 - block
    b198 - block
    b524 - block
    b63 - block
    b397 - block
    b737 - block
    b505 - block
    b415 - block
    b469 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b441 )
    ( on b133 b441 )
    ( on b95 b133 )
    ( on b203 b95 )
    ( on b881 b203 )
    ( on b211 b881 )
    ( on b101 b211 )
    ( on b199 b101 )
    ( on b321 b199 )
    ( on b71 b321 )
    ( on b23 b71 )
    ( on b659 b23 )
    ( on b634 b659 )
    ( on b912 b634 )
    ( on b244 b912 )
    ( on b303 b244 )
    ( on b420 b303 )
    ( on b404 b420 )
    ( on b402 b404 )
    ( on b665 b402 )
    ( on b456 b665 )
    ( on b689 b456 )
    ( on b198 b689 )
    ( on b524 b198 )
    ( on b63 b524 )
    ( on b397 b63 )
    ( on b737 b397 )
    ( on b505 b737 )
    ( on b415 b505 )
    ( on b469 b415 )
    ( clear b469 )
  )
  ( :tasks
    ( Make-29Pile b133 b95 b203 b881 b211 b101 b199 b321 b71 b23 b659 b634 b912 b244 b303 b420 b404 b402 b665 b456 b689 b198 b524 b63 b397 b737 b505 b415 b469 )
  )
)
