( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b303 - block
    b131 - block
    b308 - block
    b698 - block
    b127 - block
    b268 - block
    b948 - block
    b16 - block
    b350 - block
    b341 - block
    b181 - block
    b525 - block
    b810 - block
    b269 - block
    b39 - block
    b266 - block
    b760 - block
    b507 - block
    b841 - block
    b623 - block
    b157 - block
    b324 - block
    b851 - block
    b557 - block
    b178 - block
    b996 - block
    b855 - block
    b646 - block
    b215 - block
    b995 - block
    b123 - block
    b455 - block
    b904 - block
    b795 - block
    b483 - block
    b174 - block
    b979 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b303 )
    ( on b131 b303 )
    ( on b308 b131 )
    ( on b698 b308 )
    ( on b127 b698 )
    ( on b268 b127 )
    ( on b948 b268 )
    ( on b16 b948 )
    ( on b350 b16 )
    ( on b341 b350 )
    ( on b181 b341 )
    ( on b525 b181 )
    ( on b810 b525 )
    ( on b269 b810 )
    ( on b39 b269 )
    ( on b266 b39 )
    ( on b760 b266 )
    ( on b507 b760 )
    ( on b841 b507 )
    ( on b623 b841 )
    ( on b157 b623 )
    ( on b324 b157 )
    ( on b851 b324 )
    ( on b557 b851 )
    ( on b178 b557 )
    ( on b996 b178 )
    ( on b855 b996 )
    ( on b646 b855 )
    ( on b215 b646 )
    ( on b995 b215 )
    ( on b123 b995 )
    ( on b455 b123 )
    ( on b904 b455 )
    ( on b795 b904 )
    ( on b483 b795 )
    ( on b174 b483 )
    ( on b979 b174 )
    ( clear b979 )
  )
  ( :goal
    ( and
      ( clear b303 )
    )
  )
)
