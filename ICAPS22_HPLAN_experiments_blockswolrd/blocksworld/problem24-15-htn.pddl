( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b682 - block
    b451 - block
    b181 - block
    b539 - block
    b728 - block
    b674 - block
    b128 - block
    b57 - block
    b872 - block
    b414 - block
    b413 - block
    b379 - block
    b217 - block
    b602 - block
    b198 - block
    b152 - block
    b398 - block
    b835 - block
    b991 - block
    b867 - block
    b73 - block
    b94 - block
    b474 - block
    b882 - block
    b328 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b682 )
    ( on b451 b682 )
    ( on b181 b451 )
    ( on b539 b181 )
    ( on b728 b539 )
    ( on b674 b728 )
    ( on b128 b674 )
    ( on b57 b128 )
    ( on b872 b57 )
    ( on b414 b872 )
    ( on b413 b414 )
    ( on b379 b413 )
    ( on b217 b379 )
    ( on b602 b217 )
    ( on b198 b602 )
    ( on b152 b198 )
    ( on b398 b152 )
    ( on b835 b398 )
    ( on b991 b835 )
    ( on b867 b991 )
    ( on b73 b867 )
    ( on b94 b73 )
    ( on b474 b94 )
    ( on b882 b474 )
    ( on b328 b882 )
    ( clear b328 )
  )
  ( :tasks
    ( Make-24Pile b451 b181 b539 b728 b674 b128 b57 b872 b414 b413 b379 b217 b602 b198 b152 b398 b835 b991 b867 b73 b94 b474 b882 b328 )
  )
)
