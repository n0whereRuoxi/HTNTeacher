( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b881 - block
    b508 - block
    b453 - block
    b694 - block
    b686 - block
    b110 - block
    b726 - block
    b884 - block
    b645 - block
    b83 - block
    b911 - block
    b275 - block
    b445 - block
    b55 - block
    b685 - block
    b180 - block
    b403 - block
    b292 - block
    b195 - block
    b983 - block
    b807 - block
    b579 - block
    b385 - block
    b406 - block
    b526 - block
    b359 - block
    b604 - block
    b254 - block
    b582 - block
    b667 - block
    b798 - block
    b439 - block
    b371 - block
    b452 - block
    b86 - block
    b568 - block
    b118 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b881 )
    ( on b508 b881 )
    ( on b453 b508 )
    ( on b694 b453 )
    ( on b686 b694 )
    ( on b110 b686 )
    ( on b726 b110 )
    ( on b884 b726 )
    ( on b645 b884 )
    ( on b83 b645 )
    ( on b911 b83 )
    ( on b275 b911 )
    ( on b445 b275 )
    ( on b55 b445 )
    ( on b685 b55 )
    ( on b180 b685 )
    ( on b403 b180 )
    ( on b292 b403 )
    ( on b195 b292 )
    ( on b983 b195 )
    ( on b807 b983 )
    ( on b579 b807 )
    ( on b385 b579 )
    ( on b406 b385 )
    ( on b526 b406 )
    ( on b359 b526 )
    ( on b604 b359 )
    ( on b254 b604 )
    ( on b582 b254 )
    ( on b667 b582 )
    ( on b798 b667 )
    ( on b439 b798 )
    ( on b371 b439 )
    ( on b452 b371 )
    ( on b86 b452 )
    ( on b568 b86 )
    ( on b118 b568 )
    ( clear b118 )
  )
  ( :goal
    ( and
      ( clear b881 )
    )
  )
)
