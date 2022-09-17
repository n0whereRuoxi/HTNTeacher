( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b17 - block
    b895 - block
    b943 - block
    b131 - block
    b74 - block
    b137 - block
    b645 - block
    b134 - block
    b785 - block
    b903 - block
    b280 - block
    b66 - block
    b644 - block
    b543 - block
    b268 - block
    b563 - block
    b561 - block
    b254 - block
    b654 - block
    b676 - block
    b928 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b17 )
    ( on b895 b17 )
    ( on b943 b895 )
    ( on b131 b943 )
    ( on b74 b131 )
    ( on b137 b74 )
    ( on b645 b137 )
    ( on b134 b645 )
    ( on b785 b134 )
    ( on b903 b785 )
    ( on b280 b903 )
    ( on b66 b280 )
    ( on b644 b66 )
    ( on b543 b644 )
    ( on b268 b543 )
    ( on b563 b268 )
    ( on b561 b563 )
    ( on b254 b561 )
    ( on b654 b254 )
    ( on b676 b654 )
    ( on b928 b676 )
    ( clear b928 )
  )
  ( :tasks
    ( Make-20Pile b895 b943 b131 b74 b137 b645 b134 b785 b903 b280 b66 b644 b543 b268 b563 b561 b254 b654 b676 b928 )
  )
)
