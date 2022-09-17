( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b513 - block
    b935 - block
    b181 - block
    b808 - block
    b37 - block
    b228 - block
    b351 - block
    b450 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b513 )
    ( on b935 b513 )
    ( on b181 b935 )
    ( on b808 b181 )
    ( on b37 b808 )
    ( on b228 b37 )
    ( on b351 b228 )
    ( on b450 b351 )
    ( clear b450 )
  )
  ( :tasks
    ( Make-7Pile b935 b181 b808 b37 b228 b351 b450 )
  )
)
