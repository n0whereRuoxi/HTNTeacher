( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b545 - block
    b979 - block
    b540 - block
    b500 - block
    b841 - block
    b409 - block
    b927 - block
    b934 - block
    b357 - block
    b192 - block
    b907 - block
    b915 - block
    b103 - block
    b284 - block
    b371 - block
    b985 - block
    b885 - block
    b940 - block
    b861 - block
    b288 - block
    b554 - block
    b471 - block
    b57 - block
    b706 - block
    b801 - block
    b878 - block
    b535 - block
    b115 - block
    b891 - block
    b131 - block
    b667 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b545 )
    ( on b979 b545 )
    ( on b540 b979 )
    ( on b500 b540 )
    ( on b841 b500 )
    ( on b409 b841 )
    ( on b927 b409 )
    ( on b934 b927 )
    ( on b357 b934 )
    ( on b192 b357 )
    ( on b907 b192 )
    ( on b915 b907 )
    ( on b103 b915 )
    ( on b284 b103 )
    ( on b371 b284 )
    ( on b985 b371 )
    ( on b885 b985 )
    ( on b940 b885 )
    ( on b861 b940 )
    ( on b288 b861 )
    ( on b554 b288 )
    ( on b471 b554 )
    ( on b57 b471 )
    ( on b706 b57 )
    ( on b801 b706 )
    ( on b878 b801 )
    ( on b535 b878 )
    ( on b115 b535 )
    ( on b891 b115 )
    ( on b131 b891 )
    ( on b667 b131 )
    ( clear b667 )
  )
  ( :goal
    ( and
      ( clear b545 )
    )
  )
)
