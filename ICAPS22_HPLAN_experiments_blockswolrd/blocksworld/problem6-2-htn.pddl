( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b181 - block
    b700 - block
    b169 - block
    b898 - block
    b53 - block
    b158 - block
    b442 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b181 )
    ( on b700 b181 )
    ( on b169 b700 )
    ( on b898 b169 )
    ( on b53 b898 )
    ( on b158 b53 )
    ( on b442 b158 )
    ( clear b442 )
  )
  ( :tasks
    ( Make-6Pile b700 b169 b898 b53 b158 b442 )
  )
)
