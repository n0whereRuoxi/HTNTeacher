( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b66 - block
    b954 - block
    b722 - block
    b468 - block
    b918 - block
    b289 - block
    b335 - block
    b13 - block
    b724 - block
    b416 - block
    b950 - block
    b773 - block
    b389 - block
    b325 - block
    b250 - block
    b275 - block
    b21 - block
    b604 - block
    b940 - block
    b688 - block
    b516 - block
    b690 - block
    b754 - block
    b877 - block
    b805 - block
    b485 - block
    b510 - block
    b710 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b66 )
    ( on b954 b66 )
    ( on b722 b954 )
    ( on b468 b722 )
    ( on b918 b468 )
    ( on b289 b918 )
    ( on b335 b289 )
    ( on b13 b335 )
    ( on b724 b13 )
    ( on b416 b724 )
    ( on b950 b416 )
    ( on b773 b950 )
    ( on b389 b773 )
    ( on b325 b389 )
    ( on b250 b325 )
    ( on b275 b250 )
    ( on b21 b275 )
    ( on b604 b21 )
    ( on b940 b604 )
    ( on b688 b940 )
    ( on b516 b688 )
    ( on b690 b516 )
    ( on b754 b690 )
    ( on b877 b754 )
    ( on b805 b877 )
    ( on b485 b805 )
    ( on b510 b485 )
    ( on b710 b510 )
    ( clear b710 )
  )
  ( :goal
    ( and
      ( clear b66 )
    )
  )
)
