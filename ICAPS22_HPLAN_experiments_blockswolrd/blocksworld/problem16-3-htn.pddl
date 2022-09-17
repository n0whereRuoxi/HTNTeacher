( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b968 - block
    b178 - block
    b435 - block
    b450 - block
    b983 - block
    b930 - block
    b327 - block
    b697 - block
    b200 - block
    b581 - block
    b461 - block
    b120 - block
    b184 - block
    b786 - block
    b943 - block
    b534 - block
    b899 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b968 )
    ( on b178 b968 )
    ( on b435 b178 )
    ( on b450 b435 )
    ( on b983 b450 )
    ( on b930 b983 )
    ( on b327 b930 )
    ( on b697 b327 )
    ( on b200 b697 )
    ( on b581 b200 )
    ( on b461 b581 )
    ( on b120 b461 )
    ( on b184 b120 )
    ( on b786 b184 )
    ( on b943 b786 )
    ( on b534 b943 )
    ( on b899 b534 )
    ( clear b899 )
  )
  ( :tasks
    ( Make-16Pile b178 b435 b450 b983 b930 b327 b697 b200 b581 b461 b120 b184 b786 b943 b534 b899 )
  )
)
