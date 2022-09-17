( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b840 - block
    b667 - block
    b616 - block
    b966 - block
    b613 - block
    b681 - block
    b784 - block
    b615 - block
    b367 - block
    b521 - block
    b863 - block
    b85 - block
    b123 - block
    b688 - block
    b935 - block
    b19 - block
    b983 - block
    b595 - block
    b405 - block
    b53 - block
    b653 - block
    b914 - block
    b567 - block
    b810 - block
    b820 - block
    b300 - block
    b777 - block
    b704 - block
    b283 - block
    b128 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b840 )
    ( on b667 b840 )
    ( on b616 b667 )
    ( on b966 b616 )
    ( on b613 b966 )
    ( on b681 b613 )
    ( on b784 b681 )
    ( on b615 b784 )
    ( on b367 b615 )
    ( on b521 b367 )
    ( on b863 b521 )
    ( on b85 b863 )
    ( on b123 b85 )
    ( on b688 b123 )
    ( on b935 b688 )
    ( on b19 b935 )
    ( on b983 b19 )
    ( on b595 b983 )
    ( on b405 b595 )
    ( on b53 b405 )
    ( on b653 b53 )
    ( on b914 b653 )
    ( on b567 b914 )
    ( on b810 b567 )
    ( on b820 b810 )
    ( on b300 b820 )
    ( on b777 b300 )
    ( on b704 b777 )
    ( on b283 b704 )
    ( on b128 b283 )
    ( clear b128 )
  )
  ( :goal
    ( and
      ( clear b840 )
    )
  )
)
