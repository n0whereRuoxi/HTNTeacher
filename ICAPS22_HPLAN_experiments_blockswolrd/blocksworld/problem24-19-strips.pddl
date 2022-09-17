( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b963 - block
    b279 - block
    b1 - block
    b183 - block
    b503 - block
    b220 - block
    b244 - block
    b180 - block
    b467 - block
    b119 - block
    b696 - block
    b632 - block
    b611 - block
    b326 - block
    b274 - block
    b653 - block
    b861 - block
    b667 - block
    b334 - block
    b828 - block
    b712 - block
    b581 - block
    b217 - block
    b257 - block
    b616 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b963 )
    ( on b279 b963 )
    ( on b1 b279 )
    ( on b183 b1 )
    ( on b503 b183 )
    ( on b220 b503 )
    ( on b244 b220 )
    ( on b180 b244 )
    ( on b467 b180 )
    ( on b119 b467 )
    ( on b696 b119 )
    ( on b632 b696 )
    ( on b611 b632 )
    ( on b326 b611 )
    ( on b274 b326 )
    ( on b653 b274 )
    ( on b861 b653 )
    ( on b667 b861 )
    ( on b334 b667 )
    ( on b828 b334 )
    ( on b712 b828 )
    ( on b581 b712 )
    ( on b217 b581 )
    ( on b257 b217 )
    ( on b616 b257 )
    ( clear b616 )
  )
  ( :goal
    ( and
      ( clear b963 )
    )
  )
)
