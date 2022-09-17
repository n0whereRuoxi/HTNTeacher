( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b383 - block
    b959 - block
    b349 - block
    b748 - block
    b248 - block
    b267 - block
    b331 - block
    b750 - block
    b381 - block
    b224 - block
    b934 - block
    b280 - block
    b37 - block
    b245 - block
    b5 - block
    b814 - block
    b643 - block
    b205 - block
    b950 - block
    b130 - block
    b476 - block
    b578 - block
    b943 - block
    b275 - block
    b307 - block
    b454 - block
    b534 - block
    b866 - block
    b434 - block
    b516 - block
    b497 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b383 )
    ( on b959 b383 )
    ( on b349 b959 )
    ( on b748 b349 )
    ( on b248 b748 )
    ( on b267 b248 )
    ( on b331 b267 )
    ( on b750 b331 )
    ( on b381 b750 )
    ( on b224 b381 )
    ( on b934 b224 )
    ( on b280 b934 )
    ( on b37 b280 )
    ( on b245 b37 )
    ( on b5 b245 )
    ( on b814 b5 )
    ( on b643 b814 )
    ( on b205 b643 )
    ( on b950 b205 )
    ( on b130 b950 )
    ( on b476 b130 )
    ( on b578 b476 )
    ( on b943 b578 )
    ( on b275 b943 )
    ( on b307 b275 )
    ( on b454 b307 )
    ( on b534 b454 )
    ( on b866 b534 )
    ( on b434 b866 )
    ( on b516 b434 )
    ( on b497 b516 )
    ( clear b497 )
  )
  ( :goal
    ( and
      ( clear b383 )
    )
  )
)
