( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b89 - block
    b691 - block
    b127 - block
    b107 - block
    b120 - block
    b77 - block
    b178 - block
    b439 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b89 )
    ( on b691 b89 )
    ( on b127 b691 )
    ( on b107 b127 )
    ( on b120 b107 )
    ( on b77 b120 )
    ( on b178 b77 )
    ( on b439 b178 )
    ( clear b439 )
  )
  ( :tasks
    ( Make-7Pile b691 b127 b107 b120 b77 b178 b439 )
  )
)
