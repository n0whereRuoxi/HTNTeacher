( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b332 - block
    b435 - block
    b884 - block
    b363 - block
    b872 - block
    b263 - block
    b705 - block
    b647 - block
    b308 - block
    b237 - block
    b586 - block
    b390 - block
    b348 - block
    b929 - block
    b236 - block
    b514 - block
    b665 - block
    b886 - block
    b256 - block
    b439 - block
    b228 - block
    b611 - block
    b592 - block
    b374 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b332 )
    ( on b435 b332 )
    ( on b884 b435 )
    ( on b363 b884 )
    ( on b872 b363 )
    ( on b263 b872 )
    ( on b705 b263 )
    ( on b647 b705 )
    ( on b308 b647 )
    ( on b237 b308 )
    ( on b586 b237 )
    ( on b390 b586 )
    ( on b348 b390 )
    ( on b929 b348 )
    ( on b236 b929 )
    ( on b514 b236 )
    ( on b665 b514 )
    ( on b886 b665 )
    ( on b256 b886 )
    ( on b439 b256 )
    ( on b228 b439 )
    ( on b611 b228 )
    ( on b592 b611 )
    ( on b374 b592 )
    ( clear b374 )
  )
  ( :tasks
    ( Make-23Pile b435 b884 b363 b872 b263 b705 b647 b308 b237 b586 b390 b348 b929 b236 b514 b665 b886 b256 b439 b228 b611 b592 b374 )
  )
)
