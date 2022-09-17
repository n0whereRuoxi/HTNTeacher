( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b440 - block
    b195 - block
    b670 - block
    b54 - block
    b657 - block
    b124 - block
    b382 - block
    b820 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b440 )
    ( on b195 b440 )
    ( on b670 b195 )
    ( on b54 b670 )
    ( on b657 b54 )
    ( on b124 b657 )
    ( on b382 b124 )
    ( on b820 b382 )
    ( clear b820 )
  )
  ( :tasks
    ( Make-7Pile b195 b670 b54 b657 b124 b382 b820 )
  )
)
