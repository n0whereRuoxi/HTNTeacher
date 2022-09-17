( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b502 - block
    b486 - block
    b511 - block
    b957 - block
    b994 - block
    b926 - block
    b159 - block
    b605 - block
    b755 - block
    b283 - block
    b25 - block
    b626 - block
    b215 - block
    b498 - block
    b139 - block
    b133 - block
    b608 - block
    b269 - block
    b537 - block
    b119 - block
    b862 - block
    b870 - block
    b29 - block
    b120 - block
    b889 - block
    b284 - block
    b175 - block
    b343 - block
    b309 - block
    b569 - block
    b922 - block
    b46 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b502 )
    ( on b486 b502 )
    ( on b511 b486 )
    ( on b957 b511 )
    ( on b994 b957 )
    ( on b926 b994 )
    ( on b159 b926 )
    ( on b605 b159 )
    ( on b755 b605 )
    ( on b283 b755 )
    ( on b25 b283 )
    ( on b626 b25 )
    ( on b215 b626 )
    ( on b498 b215 )
    ( on b139 b498 )
    ( on b133 b139 )
    ( on b608 b133 )
    ( on b269 b608 )
    ( on b537 b269 )
    ( on b119 b537 )
    ( on b862 b119 )
    ( on b870 b862 )
    ( on b29 b870 )
    ( on b120 b29 )
    ( on b889 b120 )
    ( on b284 b889 )
    ( on b175 b284 )
    ( on b343 b175 )
    ( on b309 b343 )
    ( on b569 b309 )
    ( on b922 b569 )
    ( on b46 b922 )
    ( clear b46 )
  )
  ( :goal
    ( and
      ( clear b502 )
    )
  )
)
