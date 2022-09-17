( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b432 - block
    b595 - block
    b605 - block
    b278 - block
    b266 - block
    b322 - block
    b565 - block
    b753 - block
    b226 - block
    b155 - block
    b972 - block
    b670 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b432 )
    ( on b595 b432 )
    ( on b605 b595 )
    ( on b278 b605 )
    ( on b266 b278 )
    ( on b322 b266 )
    ( on b565 b322 )
    ( on b753 b565 )
    ( on b226 b753 )
    ( on b155 b226 )
    ( on b972 b155 )
    ( on b670 b972 )
    ( clear b670 )
  )
  ( :tasks
    ( Make-11Pile b595 b605 b278 b266 b322 b565 b753 b226 b155 b972 b670 )
  )
)
