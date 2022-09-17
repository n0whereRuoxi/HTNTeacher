( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b878 - block
    b421 - block
    b655 - block
    b117 - block
    b907 - block
    b637 - block
    b560 - block
    b452 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b878 )
    ( on b421 b878 )
    ( on b655 b421 )
    ( on b117 b655 )
    ( on b907 b117 )
    ( on b637 b907 )
    ( on b560 b637 )
    ( on b452 b560 )
    ( clear b452 )
  )
  ( :tasks
    ( Make-7Pile b421 b655 b117 b907 b637 b560 b452 )
  )
)
