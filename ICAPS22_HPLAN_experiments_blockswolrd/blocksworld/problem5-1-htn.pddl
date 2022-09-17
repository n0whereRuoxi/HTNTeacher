( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b222 - block
    b813 - block
    b113 - block
    b215 - block
    b37 - block
    b313 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b222 )
    ( on b813 b222 )
    ( on b113 b813 )
    ( on b215 b113 )
    ( on b37 b215 )
    ( on b313 b37 )
    ( clear b313 )
  )
  ( :tasks
    ( Make-5Pile b813 b113 b215 b37 b313 )
  )
)
