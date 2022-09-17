( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b613 - block
    b420 - block
    b913 - block
    b932 - block
    b329 - block
    b645 - block
    b268 - block
    b937 - block
    b537 - block
    b35 - block
    b508 - block
    b659 - block
    b395 - block
    b574 - block
    b714 - block
    b80 - block
    b320 - block
    b902 - block
    b946 - block
    b107 - block
    b324 - block
    b263 - block
    b224 - block
    b464 - block
    b12 - block
    b258 - block
    b927 - block
    b122 - block
    b18 - block
    b385 - block
    b265 - block
    b547 - block
    b104 - block
    b720 - block
    b698 - block
    b898 - block
    b964 - block
    b614 - block
    b255 - block
    b452 - block
    b181 - block
    b228 - block
    b540 - block
    b489 - block
    b103 - block
    b751 - block
    b283 - block
    b421 - block
    b722 - block
    b153 - block
    b797 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b613 )
    ( on b420 b613 )
    ( on b913 b420 )
    ( on b932 b913 )
    ( on b329 b932 )
    ( on b645 b329 )
    ( on b268 b645 )
    ( on b937 b268 )
    ( on b537 b937 )
    ( on b35 b537 )
    ( on b508 b35 )
    ( on b659 b508 )
    ( on b395 b659 )
    ( on b574 b395 )
    ( on b714 b574 )
    ( on b80 b714 )
    ( on b320 b80 )
    ( on b902 b320 )
    ( on b946 b902 )
    ( on b107 b946 )
    ( on b324 b107 )
    ( on b263 b324 )
    ( on b224 b263 )
    ( on b464 b224 )
    ( on b12 b464 )
    ( on b258 b12 )
    ( on b927 b258 )
    ( on b122 b927 )
    ( on b18 b122 )
    ( on b385 b18 )
    ( on b265 b385 )
    ( on b547 b265 )
    ( on b104 b547 )
    ( on b720 b104 )
    ( on b698 b720 )
    ( on b898 b698 )
    ( on b964 b898 )
    ( on b614 b964 )
    ( on b255 b614 )
    ( on b452 b255 )
    ( on b181 b452 )
    ( on b228 b181 )
    ( on b540 b228 )
    ( on b489 b540 )
    ( on b103 b489 )
    ( on b751 b103 )
    ( on b283 b751 )
    ( on b421 b283 )
    ( on b722 b421 )
    ( on b153 b722 )
    ( on b797 b153 )
    ( clear b797 )
  )
  ( :goal
    ( and
      ( clear b613 )
    )
  )
)
