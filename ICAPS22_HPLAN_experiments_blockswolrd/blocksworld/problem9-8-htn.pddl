( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b592 - block
    b266 - block
    b597 - block
    b278 - block
    b598 - block
    b879 - block
    b997 - block
    b872 - block
    b521 - block
    b846 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b592 )
    ( on b266 b592 )
    ( on b597 b266 )
    ( on b278 b597 )
    ( on b598 b278 )
    ( on b879 b598 )
    ( on b997 b879 )
    ( on b872 b997 )
    ( on b521 b872 )
    ( on b846 b521 )
    ( clear b846 )
  )
  ( :tasks
    ( Make-9Pile b266 b597 b278 b598 b879 b997 b872 b521 b846 )
  )
)
