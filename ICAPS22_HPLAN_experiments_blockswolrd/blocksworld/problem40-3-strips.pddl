( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b430 - block
    b294 - block
    b834 - block
    b234 - block
    b826 - block
    b144 - block
    b991 - block
    b319 - block
    b795 - block
    b73 - block
    b831 - block
    b935 - block
    b277 - block
    b94 - block
    b761 - block
    b392 - block
    b945 - block
    b385 - block
    b762 - block
    b211 - block
    b378 - block
    b900 - block
    b381 - block
    b497 - block
    b962 - block
    b80 - block
    b375 - block
    b72 - block
    b320 - block
    b542 - block
    b66 - block
    b339 - block
    b534 - block
    b11 - block
    b946 - block
    b514 - block
    b623 - block
    b487 - block
    b540 - block
    b689 - block
    b806 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b430 )
    ( on b294 b430 )
    ( on b834 b294 )
    ( on b234 b834 )
    ( on b826 b234 )
    ( on b144 b826 )
    ( on b991 b144 )
    ( on b319 b991 )
    ( on b795 b319 )
    ( on b73 b795 )
    ( on b831 b73 )
    ( on b935 b831 )
    ( on b277 b935 )
    ( on b94 b277 )
    ( on b761 b94 )
    ( on b392 b761 )
    ( on b945 b392 )
    ( on b385 b945 )
    ( on b762 b385 )
    ( on b211 b762 )
    ( on b378 b211 )
    ( on b900 b378 )
    ( on b381 b900 )
    ( on b497 b381 )
    ( on b962 b497 )
    ( on b80 b962 )
    ( on b375 b80 )
    ( on b72 b375 )
    ( on b320 b72 )
    ( on b542 b320 )
    ( on b66 b542 )
    ( on b339 b66 )
    ( on b534 b339 )
    ( on b11 b534 )
    ( on b946 b11 )
    ( on b514 b946 )
    ( on b623 b514 )
    ( on b487 b623 )
    ( on b540 b487 )
    ( on b689 b540 )
    ( on b806 b689 )
    ( clear b806 )
  )
  ( :goal
    ( and
      ( clear b430 )
    )
  )
)
