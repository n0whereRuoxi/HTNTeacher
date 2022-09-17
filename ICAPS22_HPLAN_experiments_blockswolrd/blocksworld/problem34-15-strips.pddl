( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b770 - block
    b166 - block
    b978 - block
    b997 - block
    b198 - block
    b738 - block
    b979 - block
    b492 - block
    b575 - block
    b146 - block
    b737 - block
    b451 - block
    b845 - block
    b330 - block
    b772 - block
    b754 - block
    b639 - block
    b80 - block
    b377 - block
    b853 - block
    b981 - block
    b867 - block
    b177 - block
    b157 - block
    b964 - block
    b622 - block
    b85 - block
    b171 - block
    b158 - block
    b383 - block
    b987 - block
    b333 - block
    b630 - block
    b139 - block
    b279 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b770 )
    ( on b166 b770 )
    ( on b978 b166 )
    ( on b997 b978 )
    ( on b198 b997 )
    ( on b738 b198 )
    ( on b979 b738 )
    ( on b492 b979 )
    ( on b575 b492 )
    ( on b146 b575 )
    ( on b737 b146 )
    ( on b451 b737 )
    ( on b845 b451 )
    ( on b330 b845 )
    ( on b772 b330 )
    ( on b754 b772 )
    ( on b639 b754 )
    ( on b80 b639 )
    ( on b377 b80 )
    ( on b853 b377 )
    ( on b981 b853 )
    ( on b867 b981 )
    ( on b177 b867 )
    ( on b157 b177 )
    ( on b964 b157 )
    ( on b622 b964 )
    ( on b85 b622 )
    ( on b171 b85 )
    ( on b158 b171 )
    ( on b383 b158 )
    ( on b987 b383 )
    ( on b333 b987 )
    ( on b630 b333 )
    ( on b139 b630 )
    ( on b279 b139 )
    ( clear b279 )
  )
  ( :goal
    ( and
      ( clear b770 )
    )
  )
)
