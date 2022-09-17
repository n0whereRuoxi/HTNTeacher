( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b108 - block
    b196 - block
    b556 - block
    b640 - block
    b464 - block
    b238 - block
    b808 - block
    b774 - block
    b413 - block
    b475 - block
    b387 - block
    b440 - block
    b24 - block
    b72 - block
    b996 - block
    b884 - block
    b863 - block
    b261 - block
    b133 - block
    b771 - block
    b642 - block
    b158 - block
    b846 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b108 )
    ( on b196 b108 )
    ( on b556 b196 )
    ( on b640 b556 )
    ( on b464 b640 )
    ( on b238 b464 )
    ( on b808 b238 )
    ( on b774 b808 )
    ( on b413 b774 )
    ( on b475 b413 )
    ( on b387 b475 )
    ( on b440 b387 )
    ( on b24 b440 )
    ( on b72 b24 )
    ( on b996 b72 )
    ( on b884 b996 )
    ( on b863 b884 )
    ( on b261 b863 )
    ( on b133 b261 )
    ( on b771 b133 )
    ( on b642 b771 )
    ( on b158 b642 )
    ( on b846 b158 )
    ( clear b846 )
  )
  ( :tasks
    ( Make-22Pile b196 b556 b640 b464 b238 b808 b774 b413 b475 b387 b440 b24 b72 b996 b884 b863 b261 b133 b771 b642 b158 b846 )
  )
)
