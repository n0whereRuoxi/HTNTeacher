( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b472 - block
    b833 - block
    b514 - block
    b419 - block
    b714 - block
    b500 - block
    b362 - block
    b697 - block
    b216 - block
    b808 - block
    b611 - block
    b963 - block
    b643 - block
    b779 - block
    b228 - block
    b568 - block
    b994 - block
    b454 - block
    b817 - block
    b49 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b472 )
    ( on b833 b472 )
    ( on b514 b833 )
    ( on b419 b514 )
    ( on b714 b419 )
    ( on b500 b714 )
    ( on b362 b500 )
    ( on b697 b362 )
    ( on b216 b697 )
    ( on b808 b216 )
    ( on b611 b808 )
    ( on b963 b611 )
    ( on b643 b963 )
    ( on b779 b643 )
    ( on b228 b779 )
    ( on b568 b228 )
    ( on b994 b568 )
    ( on b454 b994 )
    ( on b817 b454 )
    ( on b49 b817 )
    ( clear b49 )
  )
  ( :goal
    ( and
      ( clear b472 )
    )
  )
)
