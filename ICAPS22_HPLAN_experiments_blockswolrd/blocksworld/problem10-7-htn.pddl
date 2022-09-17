( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b599 - block
    b427 - block
    b239 - block
    b514 - block
    b264 - block
    b678 - block
    b779 - block
    b97 - block
    b877 - block
    b166 - block
    b505 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b599 )
    ( on b427 b599 )
    ( on b239 b427 )
    ( on b514 b239 )
    ( on b264 b514 )
    ( on b678 b264 )
    ( on b779 b678 )
    ( on b97 b779 )
    ( on b877 b97 )
    ( on b166 b877 )
    ( on b505 b166 )
    ( clear b505 )
  )
  ( :tasks
    ( Make-10Pile b427 b239 b514 b264 b678 b779 b97 b877 b166 b505 )
  )
)
