( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b210 - block
    b972 - block
    b511 - block
    b679 - block
    b165 - block
    b481 - block
    b243 - block
    b701 - block
    b592 - block
    b580 - block
    b265 - block
    b933 - block
    b477 - block
    b473 - block
    b768 - block
    b970 - block
    b798 - block
    b75 - block
    b84 - block
    b667 - block
    b348 - block
    b717 - block
    b641 - block
    b783 - block
    b379 - block
    b671 - block
    b990 - block
    b633 - block
    b489 - block
    b594 - block
    b40 - block
    b889 - block
    b312 - block
    b172 - block
    b167 - block
    b346 - block
    b388 - block
    b246 - block
    b423 - block
    b553 - block
    b288 - block
    b316 - block
    b504 - block
    b57 - block
    b931 - block
    b94 - block
    b551 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b210 )
    ( on b972 b210 )
    ( on b511 b972 )
    ( on b679 b511 )
    ( on b165 b679 )
    ( on b481 b165 )
    ( on b243 b481 )
    ( on b701 b243 )
    ( on b592 b701 )
    ( on b580 b592 )
    ( on b265 b580 )
    ( on b933 b265 )
    ( on b477 b933 )
    ( on b473 b477 )
    ( on b768 b473 )
    ( on b970 b768 )
    ( on b798 b970 )
    ( on b75 b798 )
    ( on b84 b75 )
    ( on b667 b84 )
    ( on b348 b667 )
    ( on b717 b348 )
    ( on b641 b717 )
    ( on b783 b641 )
    ( on b379 b783 )
    ( on b671 b379 )
    ( on b990 b671 )
    ( on b633 b990 )
    ( on b489 b633 )
    ( on b594 b489 )
    ( on b40 b594 )
    ( on b889 b40 )
    ( on b312 b889 )
    ( on b172 b312 )
    ( on b167 b172 )
    ( on b346 b167 )
    ( on b388 b346 )
    ( on b246 b388 )
    ( on b423 b246 )
    ( on b553 b423 )
    ( on b288 b553 )
    ( on b316 b288 )
    ( on b504 b316 )
    ( on b57 b504 )
    ( on b931 b57 )
    ( on b94 b931 )
    ( on b551 b94 )
    ( clear b551 )
  )
  ( :goal
    ( and
      ( clear b210 )
    )
  )
)
