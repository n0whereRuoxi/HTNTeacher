( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b414 - block
    b88 - block
    b541 - block
    b911 - block
    b826 - block
    b255 - block
    b318 - block
    b228 - block
    b998 - block
    b271 - block
    b942 - block
    b495 - block
    b314 - block
    b756 - block
    b655 - block
    b476 - block
    b331 - block
    b851 - block
    b238 - block
    b102 - block
    b922 - block
    b858 - block
    b257 - block
    b195 - block
    b702 - block
    b230 - block
    b245 - block
    b614 - block
    b801 - block
    b128 - block
    b12 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b414 )
    ( on b88 b414 )
    ( on b541 b88 )
    ( on b911 b541 )
    ( on b826 b911 )
    ( on b255 b826 )
    ( on b318 b255 )
    ( on b228 b318 )
    ( on b998 b228 )
    ( on b271 b998 )
    ( on b942 b271 )
    ( on b495 b942 )
    ( on b314 b495 )
    ( on b756 b314 )
    ( on b655 b756 )
    ( on b476 b655 )
    ( on b331 b476 )
    ( on b851 b331 )
    ( on b238 b851 )
    ( on b102 b238 )
    ( on b922 b102 )
    ( on b858 b922 )
    ( on b257 b858 )
    ( on b195 b257 )
    ( on b702 b195 )
    ( on b230 b702 )
    ( on b245 b230 )
    ( on b614 b245 )
    ( on b801 b614 )
    ( on b128 b801 )
    ( on b12 b128 )
    ( clear b12 )
  )
  ( :tasks
    ( Make-30Pile b88 b541 b911 b826 b255 b318 b228 b998 b271 b942 b495 b314 b756 b655 b476 b331 b851 b238 b102 b922 b858 b257 b195 b702 b230 b245 b614 b801 b128 b12 )
  )
)
