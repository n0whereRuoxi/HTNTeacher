( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b413 - block
    b259 - block
    b662 - block
    b374 - block
    b258 - block
    b861 - block
    b39 - block
    b11 - block
    b16 - block
    b485 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b413 )
    ( on b259 b413 )
    ( on b662 b259 )
    ( on b374 b662 )
    ( on b258 b374 )
    ( on b861 b258 )
    ( on b39 b861 )
    ( on b11 b39 )
    ( on b16 b11 )
    ( on b485 b16 )
    ( clear b485 )
  )
  ( :tasks
    ( Make-9Pile b259 b662 b374 b258 b861 b39 b11 b16 b485 )
  )
)
