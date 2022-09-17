( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b204 - block
    b252 - block
    b650 - block
    b348 - block
    b353 - block
    b275 - block
    b155 - block
    b247 - block
    b752 - block
    b840 - block
    b954 - block
    b68 - block
    b298 - block
    b295 - block
    b778 - block
    b531 - block
    b854 - block
    b64 - block
    b410 - block
    b221 - block
    b856 - block
    b90 - block
    b188 - block
    b888 - block
    b82 - block
    b97 - block
    b529 - block
    b912 - block
    b564 - block
    b441 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b204 )
    ( on b252 b204 )
    ( on b650 b252 )
    ( on b348 b650 )
    ( on b353 b348 )
    ( on b275 b353 )
    ( on b155 b275 )
    ( on b247 b155 )
    ( on b752 b247 )
    ( on b840 b752 )
    ( on b954 b840 )
    ( on b68 b954 )
    ( on b298 b68 )
    ( on b295 b298 )
    ( on b778 b295 )
    ( on b531 b778 )
    ( on b854 b531 )
    ( on b64 b854 )
    ( on b410 b64 )
    ( on b221 b410 )
    ( on b856 b221 )
    ( on b90 b856 )
    ( on b188 b90 )
    ( on b888 b188 )
    ( on b82 b888 )
    ( on b97 b82 )
    ( on b529 b97 )
    ( on b912 b529 )
    ( on b564 b912 )
    ( on b441 b564 )
    ( clear b441 )
  )
  ( :tasks
    ( Make-29Pile b252 b650 b348 b353 b275 b155 b247 b752 b840 b954 b68 b298 b295 b778 b531 b854 b64 b410 b221 b856 b90 b188 b888 b82 b97 b529 b912 b564 b441 )
  )
)
