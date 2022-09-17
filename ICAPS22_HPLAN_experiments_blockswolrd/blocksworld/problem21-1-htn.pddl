( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b881 - block
    b898 - block
    b725 - block
    b519 - block
    b149 - block
    b19 - block
    b130 - block
    b29 - block
    b305 - block
    b60 - block
    b518 - block
    b239 - block
    b22 - block
    b530 - block
    b108 - block
    b253 - block
    b666 - block
    b69 - block
    b270 - block
    b131 - block
    b671 - block
    b654 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b881 )
    ( on b898 b881 )
    ( on b725 b898 )
    ( on b519 b725 )
    ( on b149 b519 )
    ( on b19 b149 )
    ( on b130 b19 )
    ( on b29 b130 )
    ( on b305 b29 )
    ( on b60 b305 )
    ( on b518 b60 )
    ( on b239 b518 )
    ( on b22 b239 )
    ( on b530 b22 )
    ( on b108 b530 )
    ( on b253 b108 )
    ( on b666 b253 )
    ( on b69 b666 )
    ( on b270 b69 )
    ( on b131 b270 )
    ( on b671 b131 )
    ( on b654 b671 )
    ( clear b654 )
  )
  ( :tasks
    ( Make-21Pile b898 b725 b519 b149 b19 b130 b29 b305 b60 b518 b239 b22 b530 b108 b253 b666 b69 b270 b131 b671 b654 )
  )
)
