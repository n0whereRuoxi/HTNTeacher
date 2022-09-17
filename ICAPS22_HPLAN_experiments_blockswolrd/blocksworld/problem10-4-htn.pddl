( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b898 - block
    b377 - block
    b512 - block
    b323 - block
    b718 - block
    b646 - block
    b773 - block
    b24 - block
    b462 - block
    b790 - block
    b433 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b898 )
    ( on b377 b898 )
    ( on b512 b377 )
    ( on b323 b512 )
    ( on b718 b323 )
    ( on b646 b718 )
    ( on b773 b646 )
    ( on b24 b773 )
    ( on b462 b24 )
    ( on b790 b462 )
    ( on b433 b790 )
    ( clear b433 )
  )
  ( :tasks
    ( Make-10Pile b377 b512 b323 b718 b646 b773 b24 b462 b790 b433 )
  )
)
