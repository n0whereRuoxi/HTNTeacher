( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b730 - block
    b7 - block
    b918 - block
    b494 - block
    b608 - block
    b925 - block
    b391 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b730 )
    ( on b7 b730 )
    ( on b918 b7 )
    ( on b494 b918 )
    ( on b608 b494 )
    ( on b925 b608 )
    ( on b391 b925 )
    ( clear b391 )
  )
  ( :tasks
    ( Make-6Pile b7 b918 b494 b608 b925 b391 )
  )
)
