( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b453 - block
    b637 - block
    b958 - block
    b188 - block
    b722 - block
    b988 - block
    b247 - block
    b492 - block
    b264 - block
    b730 - block
    b700 - block
    b204 - block
    b76 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b453 )
    ( on b637 b453 )
    ( on b958 b637 )
    ( on b188 b958 )
    ( on b722 b188 )
    ( on b988 b722 )
    ( on b247 b988 )
    ( on b492 b247 )
    ( on b264 b492 )
    ( on b730 b264 )
    ( on b700 b730 )
    ( on b204 b700 )
    ( on b76 b204 )
    ( clear b76 )
  )
  ( :tasks
    ( Make-12Pile b637 b958 b188 b722 b988 b247 b492 b264 b730 b700 b204 b76 )
  )
)
