( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b182 - block
    b108 - block
    b790 - block
    b26 - block
    b444 - block
    b37 - block
    b602 - block
    b823 - block
    b393 - block
    b77 - block
    b539 - block
    b5 - block
    b15 - block
    b574 - block
    b273 - block
    b102 - block
    b449 - block
    b858 - block
    b6 - block
    b511 - block
    b586 - block
    b126 - block
    b578 - block
    b21 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b182 )
    ( on b108 b182 )
    ( on b790 b108 )
    ( on b26 b790 )
    ( on b444 b26 )
    ( on b37 b444 )
    ( on b602 b37 )
    ( on b823 b602 )
    ( on b393 b823 )
    ( on b77 b393 )
    ( on b539 b77 )
    ( on b5 b539 )
    ( on b15 b5 )
    ( on b574 b15 )
    ( on b273 b574 )
    ( on b102 b273 )
    ( on b449 b102 )
    ( on b858 b449 )
    ( on b6 b858 )
    ( on b511 b6 )
    ( on b586 b511 )
    ( on b126 b586 )
    ( on b578 b126 )
    ( on b21 b578 )
    ( clear b21 )
  )
  ( :tasks
    ( Make-23Pile b108 b790 b26 b444 b37 b602 b823 b393 b77 b539 b5 b15 b574 b273 b102 b449 b858 b6 b511 b586 b126 b578 b21 )
  )
)
