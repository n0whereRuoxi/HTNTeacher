( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b138 - block
    b419 - block
    b933 - block
    b55 - block
    b536 - block
    b106 - block
    b345 - block
    b358 - block
    b285 - block
    b674 - block
    b758 - block
    b772 - block
    b641 - block
    b592 - block
    b669 - block
    b48 - block
    b193 - block
    b787 - block
    b786 - block
    b755 - block
    b446 - block
    b582 - block
    b45 - block
    b142 - block
    b84 - block
    b963 - block
    b694 - block
    b225 - block
    b425 - block
    b870 - block
    b784 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b138 )
    ( on b419 b138 )
    ( on b933 b419 )
    ( on b55 b933 )
    ( on b536 b55 )
    ( on b106 b536 )
    ( on b345 b106 )
    ( on b358 b345 )
    ( on b285 b358 )
    ( on b674 b285 )
    ( on b758 b674 )
    ( on b772 b758 )
    ( on b641 b772 )
    ( on b592 b641 )
    ( on b669 b592 )
    ( on b48 b669 )
    ( on b193 b48 )
    ( on b787 b193 )
    ( on b786 b787 )
    ( on b755 b786 )
    ( on b446 b755 )
    ( on b582 b446 )
    ( on b45 b582 )
    ( on b142 b45 )
    ( on b84 b142 )
    ( on b963 b84 )
    ( on b694 b963 )
    ( on b225 b694 )
    ( on b425 b225 )
    ( on b870 b425 )
    ( on b784 b870 )
    ( clear b784 )
  )
  ( :tasks
    ( Make-30Pile b419 b933 b55 b536 b106 b345 b358 b285 b674 b758 b772 b641 b592 b669 b48 b193 b787 b786 b755 b446 b582 b45 b142 b84 b963 b694 b225 b425 b870 b784 )
  )
)
