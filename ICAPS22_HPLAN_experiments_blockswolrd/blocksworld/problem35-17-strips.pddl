( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b295 - block
    b713 - block
    b780 - block
    b126 - block
    b215 - block
    b211 - block
    b482 - block
    b183 - block
    b762 - block
    b701 - block
    b137 - block
    b924 - block
    b581 - block
    b248 - block
    b155 - block
    b608 - block
    b591 - block
    b320 - block
    b149 - block
    b516 - block
    b25 - block
    b243 - block
    b384 - block
    b783 - block
    b207 - block
    b412 - block
    b560 - block
    b284 - block
    b166 - block
    b283 - block
    b489 - block
    b461 - block
    b278 - block
    b253 - block
    b459 - block
    b127 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b295 )
    ( on b713 b295 )
    ( on b780 b713 )
    ( on b126 b780 )
    ( on b215 b126 )
    ( on b211 b215 )
    ( on b482 b211 )
    ( on b183 b482 )
    ( on b762 b183 )
    ( on b701 b762 )
    ( on b137 b701 )
    ( on b924 b137 )
    ( on b581 b924 )
    ( on b248 b581 )
    ( on b155 b248 )
    ( on b608 b155 )
    ( on b591 b608 )
    ( on b320 b591 )
    ( on b149 b320 )
    ( on b516 b149 )
    ( on b25 b516 )
    ( on b243 b25 )
    ( on b384 b243 )
    ( on b783 b384 )
    ( on b207 b783 )
    ( on b412 b207 )
    ( on b560 b412 )
    ( on b284 b560 )
    ( on b166 b284 )
    ( on b283 b166 )
    ( on b489 b283 )
    ( on b461 b489 )
    ( on b278 b461 )
    ( on b253 b278 )
    ( on b459 b253 )
    ( on b127 b459 )
    ( clear b127 )
  )
  ( :goal
    ( and
      ( clear b295 )
    )
  )
)
