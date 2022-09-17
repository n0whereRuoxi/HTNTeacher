( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b35 - block
    b490 - block
    b962 - block
    b370 - block
    b202 - block
    b151 - block
    b115 - block
    b103 - block
    b63 - block
    b96 - block
    b897 - block
    b336 - block
    b287 - block
    b386 - block
    b123 - block
    b969 - block
    b888 - block
    b978 - block
    b450 - block
    b851 - block
    b794 - block
    b140 - block
    b254 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b35 )
    ( on b490 b35 )
    ( on b962 b490 )
    ( on b370 b962 )
    ( on b202 b370 )
    ( on b151 b202 )
    ( on b115 b151 )
    ( on b103 b115 )
    ( on b63 b103 )
    ( on b96 b63 )
    ( on b897 b96 )
    ( on b336 b897 )
    ( on b287 b336 )
    ( on b386 b287 )
    ( on b123 b386 )
    ( on b969 b123 )
    ( on b888 b969 )
    ( on b978 b888 )
    ( on b450 b978 )
    ( on b851 b450 )
    ( on b794 b851 )
    ( on b140 b794 )
    ( on b254 b140 )
    ( clear b254 )
  )
  ( :tasks
    ( Make-22Pile b490 b962 b370 b202 b151 b115 b103 b63 b96 b897 b336 b287 b386 b123 b969 b888 b978 b450 b851 b794 b140 b254 )
  )
)
