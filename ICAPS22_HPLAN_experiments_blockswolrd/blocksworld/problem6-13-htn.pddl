( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b111 - block
    b846 - block
    b80 - block
    b514 - block
    b359 - block
    b372 - block
    b434 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b111 )
    ( on b846 b111 )
    ( on b80 b846 )
    ( on b514 b80 )
    ( on b359 b514 )
    ( on b372 b359 )
    ( on b434 b372 )
    ( clear b434 )
  )
  ( :tasks
    ( Make-6Pile b846 b80 b514 b359 b372 b434 )
  )
)
