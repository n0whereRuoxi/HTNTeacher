( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b310 - block
    b198 - block
    b369 - block
    b461 - block
    b886 - block
    b26 - block
    b58 - block
    b38 - block
    b379 - block
    b407 - block
    b324 - block
    b839 - block
    b463 - block
    b262 - block
    b652 - block
    b254 - block
    b611 - block
    b821 - block
    b563 - block
    b309 - block
    b504 - block
    b567 - block
    b960 - block
    b827 - block
    b104 - block
    b662 - block
    b719 - block
    b257 - block
    b978 - block
    b560 - block
    b671 - block
    b66 - block
    b384 - block
    b621 - block
    b636 - block
    b790 - block
    b122 - block
    b523 - block
    b927 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b310 )
    ( on b198 b310 )
    ( on b369 b198 )
    ( on b461 b369 )
    ( on b886 b461 )
    ( on b26 b886 )
    ( on b58 b26 )
    ( on b38 b58 )
    ( on b379 b38 )
    ( on b407 b379 )
    ( on b324 b407 )
    ( on b839 b324 )
    ( on b463 b839 )
    ( on b262 b463 )
    ( on b652 b262 )
    ( on b254 b652 )
    ( on b611 b254 )
    ( on b821 b611 )
    ( on b563 b821 )
    ( on b309 b563 )
    ( on b504 b309 )
    ( on b567 b504 )
    ( on b960 b567 )
    ( on b827 b960 )
    ( on b104 b827 )
    ( on b662 b104 )
    ( on b719 b662 )
    ( on b257 b719 )
    ( on b978 b257 )
    ( on b560 b978 )
    ( on b671 b560 )
    ( on b66 b671 )
    ( on b384 b66 )
    ( on b621 b384 )
    ( on b636 b621 )
    ( on b790 b636 )
    ( on b122 b790 )
    ( on b523 b122 )
    ( on b927 b523 )
    ( clear b927 )
  )
  ( :goal
    ( and
      ( clear b310 )
    )
  )
)
