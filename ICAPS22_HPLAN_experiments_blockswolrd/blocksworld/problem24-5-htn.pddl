( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b957 - block
    b418 - block
    b851 - block
    b679 - block
    b628 - block
    b568 - block
    b653 - block
    b81 - block
    b569 - block
    b961 - block
    b715 - block
    b313 - block
    b398 - block
    b191 - block
    b321 - block
    b258 - block
    b480 - block
    b970 - block
    b71 - block
    b417 - block
    b314 - block
    b124 - block
    b490 - block
    b455 - block
    b730 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b957 )
    ( on b418 b957 )
    ( on b851 b418 )
    ( on b679 b851 )
    ( on b628 b679 )
    ( on b568 b628 )
    ( on b653 b568 )
    ( on b81 b653 )
    ( on b569 b81 )
    ( on b961 b569 )
    ( on b715 b961 )
    ( on b313 b715 )
    ( on b398 b313 )
    ( on b191 b398 )
    ( on b321 b191 )
    ( on b258 b321 )
    ( on b480 b258 )
    ( on b970 b480 )
    ( on b71 b970 )
    ( on b417 b71 )
    ( on b314 b417 )
    ( on b124 b314 )
    ( on b490 b124 )
    ( on b455 b490 )
    ( on b730 b455 )
    ( clear b730 )
  )
  ( :tasks
    ( Make-24Pile b418 b851 b679 b628 b568 b653 b81 b569 b961 b715 b313 b398 b191 b321 b258 b480 b970 b71 b417 b314 b124 b490 b455 b730 )
  )
)
