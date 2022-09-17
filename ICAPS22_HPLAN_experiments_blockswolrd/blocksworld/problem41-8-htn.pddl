( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b246 - block
    b732 - block
    b848 - block
    b244 - block
    b310 - block
    b444 - block
    b166 - block
    b342 - block
    b402 - block
    b773 - block
    b703 - block
    b297 - block
    b188 - block
    b999 - block
    b696 - block
    b734 - block
    b743 - block
    b336 - block
    b276 - block
    b465 - block
    b561 - block
    b140 - block
    b144 - block
    b508 - block
    b928 - block
    b308 - block
    b30 - block
    b675 - block
    b273 - block
    b409 - block
    b481 - block
    b55 - block
    b78 - block
    b737 - block
    b605 - block
    b74 - block
    b305 - block
    b230 - block
    b701 - block
    b210 - block
    b890 - block
    b623 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b246 )
    ( on b732 b246 )
    ( on b848 b732 )
    ( on b244 b848 )
    ( on b310 b244 )
    ( on b444 b310 )
    ( on b166 b444 )
    ( on b342 b166 )
    ( on b402 b342 )
    ( on b773 b402 )
    ( on b703 b773 )
    ( on b297 b703 )
    ( on b188 b297 )
    ( on b999 b188 )
    ( on b696 b999 )
    ( on b734 b696 )
    ( on b743 b734 )
    ( on b336 b743 )
    ( on b276 b336 )
    ( on b465 b276 )
    ( on b561 b465 )
    ( on b140 b561 )
    ( on b144 b140 )
    ( on b508 b144 )
    ( on b928 b508 )
    ( on b308 b928 )
    ( on b30 b308 )
    ( on b675 b30 )
    ( on b273 b675 )
    ( on b409 b273 )
    ( on b481 b409 )
    ( on b55 b481 )
    ( on b78 b55 )
    ( on b737 b78 )
    ( on b605 b737 )
    ( on b74 b605 )
    ( on b305 b74 )
    ( on b230 b305 )
    ( on b701 b230 )
    ( on b210 b701 )
    ( on b890 b210 )
    ( on b623 b890 )
    ( clear b623 )
  )
  ( :tasks
    ( Make-41Pile b732 b848 b244 b310 b444 b166 b342 b402 b773 b703 b297 b188 b999 b696 b734 b743 b336 b276 b465 b561 b140 b144 b508 b928 b308 b30 b675 b273 b409 b481 b55 b78 b737 b605 b74 b305 b230 b701 b210 b890 b623 )
  )
)
