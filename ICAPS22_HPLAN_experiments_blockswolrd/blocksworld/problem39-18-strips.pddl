( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b536 - block
    b472 - block
    b700 - block
    b231 - block
    b599 - block
    b467 - block
    b465 - block
    b944 - block
    b234 - block
    b666 - block
    b894 - block
    b254 - block
    b107 - block
    b812 - block
    b870 - block
    b265 - block
    b20 - block
    b1 - block
    b573 - block
    b637 - block
    b187 - block
    b559 - block
    b108 - block
    b442 - block
    b163 - block
    b127 - block
    b537 - block
    b865 - block
    b36 - block
    b895 - block
    b362 - block
    b635 - block
    b963 - block
    b323 - block
    b926 - block
    b146 - block
    b638 - block
    b813 - block
    b294 - block
    b275 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b536 )
    ( on b472 b536 )
    ( on b700 b472 )
    ( on b231 b700 )
    ( on b599 b231 )
    ( on b467 b599 )
    ( on b465 b467 )
    ( on b944 b465 )
    ( on b234 b944 )
    ( on b666 b234 )
    ( on b894 b666 )
    ( on b254 b894 )
    ( on b107 b254 )
    ( on b812 b107 )
    ( on b870 b812 )
    ( on b265 b870 )
    ( on b20 b265 )
    ( on b1 b20 )
    ( on b573 b1 )
    ( on b637 b573 )
    ( on b187 b637 )
    ( on b559 b187 )
    ( on b108 b559 )
    ( on b442 b108 )
    ( on b163 b442 )
    ( on b127 b163 )
    ( on b537 b127 )
    ( on b865 b537 )
    ( on b36 b865 )
    ( on b895 b36 )
    ( on b362 b895 )
    ( on b635 b362 )
    ( on b963 b635 )
    ( on b323 b963 )
    ( on b926 b323 )
    ( on b146 b926 )
    ( on b638 b146 )
    ( on b813 b638 )
    ( on b294 b813 )
    ( on b275 b294 )
    ( clear b275 )
  )
  ( :goal
    ( and
      ( clear b536 )
    )
  )
)
