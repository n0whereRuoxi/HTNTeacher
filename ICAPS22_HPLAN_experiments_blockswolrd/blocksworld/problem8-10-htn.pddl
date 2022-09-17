( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b136 - block
    b186 - block
    b831 - block
    b697 - block
    b914 - block
    b365 - block
    b636 - block
    b539 - block
    b108 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b136 )
    ( on b186 b136 )
    ( on b831 b186 )
    ( on b697 b831 )
    ( on b914 b697 )
    ( on b365 b914 )
    ( on b636 b365 )
    ( on b539 b636 )
    ( on b108 b539 )
    ( clear b108 )
  )
  ( :tasks
    ( Make-8Pile b186 b831 b697 b914 b365 b636 b539 b108 )
  )
)
