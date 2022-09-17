( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b254 - block
    b486 - block
    b946 - block
    b48 - block
    b398 - block
    b788 - block
    b379 - block
    b36 - block
    b888 - block
    b9 - block
    b165 - block
    b593 - block
    b808 - block
    b838 - block
    b769 - block
    b101 - block
    b231 - block
    b52 - block
    b86 - block
    b862 - block
    b904 - block
    b481 - block
    b454 - block
    b908 - block
    b984 - block
    b135 - block
    b127 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b254 )
    ( on b486 b254 )
    ( on b946 b486 )
    ( on b48 b946 )
    ( on b398 b48 )
    ( on b788 b398 )
    ( on b379 b788 )
    ( on b36 b379 )
    ( on b888 b36 )
    ( on b9 b888 )
    ( on b165 b9 )
    ( on b593 b165 )
    ( on b808 b593 )
    ( on b838 b808 )
    ( on b769 b838 )
    ( on b101 b769 )
    ( on b231 b101 )
    ( on b52 b231 )
    ( on b86 b52 )
    ( on b862 b86 )
    ( on b904 b862 )
    ( on b481 b904 )
    ( on b454 b481 )
    ( on b908 b454 )
    ( on b984 b908 )
    ( on b135 b984 )
    ( on b127 b135 )
    ( on b721 b127 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b254 )
    )
  )
)
