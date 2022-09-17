( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b740 - block
    b472 - block
    b571 - block
    b252 - block
    b230 - block
    b1 - block
    b638 - block
    b291 - block
    b692 - block
    b128 - block
    b944 - block
    b803 - block
    b38 - block
    b86 - block
    b236 - block
    b188 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b740 )
    ( on b472 b740 )
    ( on b571 b472 )
    ( on b252 b571 )
    ( on b230 b252 )
    ( on b1 b230 )
    ( on b638 b1 )
    ( on b291 b638 )
    ( on b692 b291 )
    ( on b128 b692 )
    ( on b944 b128 )
    ( on b803 b944 )
    ( on b38 b803 )
    ( on b86 b38 )
    ( on b236 b86 )
    ( on b188 b236 )
    ( clear b188 )
  )
  ( :tasks
    ( Make-15Pile b472 b571 b252 b230 b1 b638 b291 b692 b128 b944 b803 b38 b86 b236 b188 )
  )
)
