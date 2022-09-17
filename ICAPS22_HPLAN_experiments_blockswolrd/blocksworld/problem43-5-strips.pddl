( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b923 - block
    b844 - block
    b995 - block
    b875 - block
    b260 - block
    b590 - block
    b915 - block
    b294 - block
    b958 - block
    b967 - block
    b872 - block
    b41 - block
    b460 - block
    b700 - block
    b83 - block
    b974 - block
    b474 - block
    b511 - block
    b437 - block
    b368 - block
    b287 - block
    b285 - block
    b78 - block
    b842 - block
    b630 - block
    b770 - block
    b935 - block
    b209 - block
    b430 - block
    b892 - block
    b805 - block
    b222 - block
    b428 - block
    b635 - block
    b703 - block
    b423 - block
    b665 - block
    b376 - block
    b140 - block
    b409 - block
    b492 - block
    b354 - block
    b929 - block
    b893 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b923 )
    ( on b844 b923 )
    ( on b995 b844 )
    ( on b875 b995 )
    ( on b260 b875 )
    ( on b590 b260 )
    ( on b915 b590 )
    ( on b294 b915 )
    ( on b958 b294 )
    ( on b967 b958 )
    ( on b872 b967 )
    ( on b41 b872 )
    ( on b460 b41 )
    ( on b700 b460 )
    ( on b83 b700 )
    ( on b974 b83 )
    ( on b474 b974 )
    ( on b511 b474 )
    ( on b437 b511 )
    ( on b368 b437 )
    ( on b287 b368 )
    ( on b285 b287 )
    ( on b78 b285 )
    ( on b842 b78 )
    ( on b630 b842 )
    ( on b770 b630 )
    ( on b935 b770 )
    ( on b209 b935 )
    ( on b430 b209 )
    ( on b892 b430 )
    ( on b805 b892 )
    ( on b222 b805 )
    ( on b428 b222 )
    ( on b635 b428 )
    ( on b703 b635 )
    ( on b423 b703 )
    ( on b665 b423 )
    ( on b376 b665 )
    ( on b140 b376 )
    ( on b409 b140 )
    ( on b492 b409 )
    ( on b354 b492 )
    ( on b929 b354 )
    ( on b893 b929 )
    ( clear b893 )
  )
  ( :goal
    ( and
      ( clear b923 )
    )
  )
)
