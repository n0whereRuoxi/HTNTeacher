( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b56 - block
    b843 - block
    b861 - block
    b400 - block
    b828 - block
    b826 - block
    b214 - block
    b946 - block
    b367 - block
    b402 - block
    b423 - block
    b98 - block
    b81 - block
    b901 - block
    b705 - block
    b245 - block
    b301 - block
    b424 - block
    b549 - block
    b856 - block
    b155 - block
    b197 - block
    b847 - block
    b500 - block
    b877 - block
    b923 - block
    b972 - block
    b593 - block
    b233 - block
    b404 - block
    b156 - block
    b793 - block
    b4 - block
    b809 - block
    b187 - block
    b534 - block
    b3 - block
    b580 - block
    b658 - block
    b529 - block
    b514 - block
    b201 - block
    b52 - block
    b302 - block
    b276 - block
    b479 - block
    b236 - block
    b622 - block
    b267 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b56 )
    ( on b843 b56 )
    ( on b861 b843 )
    ( on b400 b861 )
    ( on b828 b400 )
    ( on b826 b828 )
    ( on b214 b826 )
    ( on b946 b214 )
    ( on b367 b946 )
    ( on b402 b367 )
    ( on b423 b402 )
    ( on b98 b423 )
    ( on b81 b98 )
    ( on b901 b81 )
    ( on b705 b901 )
    ( on b245 b705 )
    ( on b301 b245 )
    ( on b424 b301 )
    ( on b549 b424 )
    ( on b856 b549 )
    ( on b155 b856 )
    ( on b197 b155 )
    ( on b847 b197 )
    ( on b500 b847 )
    ( on b877 b500 )
    ( on b923 b877 )
    ( on b972 b923 )
    ( on b593 b972 )
    ( on b233 b593 )
    ( on b404 b233 )
    ( on b156 b404 )
    ( on b793 b156 )
    ( on b4 b793 )
    ( on b809 b4 )
    ( on b187 b809 )
    ( on b534 b187 )
    ( on b3 b534 )
    ( on b580 b3 )
    ( on b658 b580 )
    ( on b529 b658 )
    ( on b514 b529 )
    ( on b201 b514 )
    ( on b52 b201 )
    ( on b302 b52 )
    ( on b276 b302 )
    ( on b479 b276 )
    ( on b236 b479 )
    ( on b622 b236 )
    ( on b267 b622 )
    ( clear b267 )
  )
  ( :tasks
    ( Make-48Pile b843 b861 b400 b828 b826 b214 b946 b367 b402 b423 b98 b81 b901 b705 b245 b301 b424 b549 b856 b155 b197 b847 b500 b877 b923 b972 b593 b233 b404 b156 b793 b4 b809 b187 b534 b3 b580 b658 b529 b514 b201 b52 b302 b276 b479 b236 b622 b267 )
  )
)
