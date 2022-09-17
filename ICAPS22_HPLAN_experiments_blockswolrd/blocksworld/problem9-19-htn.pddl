( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b439 - block
    b746 - block
    b541 - block
    b994 - block
    b411 - block
    b318 - block
    b357 - block
    b599 - block
    b485 - block
    b537 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b439 )
    ( on b746 b439 )
    ( on b541 b746 )
    ( on b994 b541 )
    ( on b411 b994 )
    ( on b318 b411 )
    ( on b357 b318 )
    ( on b599 b357 )
    ( on b485 b599 )
    ( on b537 b485 )
    ( clear b537 )
  )
  ( :tasks
    ( Make-9Pile b746 b541 b994 b411 b318 b357 b599 b485 b537 )
  )
)
