( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b265 - block
    b464 - block
    b192 - block
    b408 - block
    b37 - block
    b871 - block
    b178 - block
    b98 - block
    b420 - block
    b988 - block
    b104 - block
    b247 - block
    b515 - block
    b541 - block
    b631 - block
    b588 - block
    b328 - block
    b284 - block
    b751 - block
    b157 - block
    b561 - block
    b456 - block
    b238 - block
    b639 - block
    b110 - block
    b897 - block
    b884 - block
    b133 - block
    b393 - block
    b210 - block
    b69 - block
    b245 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b265 )
    ( on b464 b265 )
    ( on b192 b464 )
    ( on b408 b192 )
    ( on b37 b408 )
    ( on b871 b37 )
    ( on b178 b871 )
    ( on b98 b178 )
    ( on b420 b98 )
    ( on b988 b420 )
    ( on b104 b988 )
    ( on b247 b104 )
    ( on b515 b247 )
    ( on b541 b515 )
    ( on b631 b541 )
    ( on b588 b631 )
    ( on b328 b588 )
    ( on b284 b328 )
    ( on b751 b284 )
    ( on b157 b751 )
    ( on b561 b157 )
    ( on b456 b561 )
    ( on b238 b456 )
    ( on b639 b238 )
    ( on b110 b639 )
    ( on b897 b110 )
    ( on b884 b897 )
    ( on b133 b884 )
    ( on b393 b133 )
    ( on b210 b393 )
    ( on b69 b210 )
    ( on b245 b69 )
    ( clear b245 )
  )
  ( :goal
    ( and
      ( clear b265 )
    )
  )
)
