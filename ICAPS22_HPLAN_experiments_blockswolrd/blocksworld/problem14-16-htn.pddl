( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b28 - block
    b400 - block
    b185 - block
    b36 - block
    b572 - block
    b464 - block
    b902 - block
    b314 - block
    b860 - block
    b98 - block
    b754 - block
    b829 - block
    b175 - block
    b882 - block
    b923 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b28 )
    ( on b400 b28 )
    ( on b185 b400 )
    ( on b36 b185 )
    ( on b572 b36 )
    ( on b464 b572 )
    ( on b902 b464 )
    ( on b314 b902 )
    ( on b860 b314 )
    ( on b98 b860 )
    ( on b754 b98 )
    ( on b829 b754 )
    ( on b175 b829 )
    ( on b882 b175 )
    ( on b923 b882 )
    ( clear b923 )
  )
  ( :tasks
    ( Make-14Pile b400 b185 b36 b572 b464 b902 b314 b860 b98 b754 b829 b175 b882 b923 )
  )
)
