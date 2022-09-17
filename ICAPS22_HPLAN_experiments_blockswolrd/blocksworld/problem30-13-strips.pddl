( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b249 - block
    b495 - block
    b441 - block
    b717 - block
    b106 - block
    b348 - block
    b36 - block
    b134 - block
    b454 - block
    b238 - block
    b961 - block
    b110 - block
    b560 - block
    b278 - block
    b645 - block
    b746 - block
    b359 - block
    b59 - block
    b109 - block
    b170 - block
    b886 - block
    b798 - block
    b965 - block
    b139 - block
    b284 - block
    b374 - block
    b876 - block
    b370 - block
    b837 - block
    b710 - block
    b924 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b249 )
    ( on b495 b249 )
    ( on b441 b495 )
    ( on b717 b441 )
    ( on b106 b717 )
    ( on b348 b106 )
    ( on b36 b348 )
    ( on b134 b36 )
    ( on b454 b134 )
    ( on b238 b454 )
    ( on b961 b238 )
    ( on b110 b961 )
    ( on b560 b110 )
    ( on b278 b560 )
    ( on b645 b278 )
    ( on b746 b645 )
    ( on b359 b746 )
    ( on b59 b359 )
    ( on b109 b59 )
    ( on b170 b109 )
    ( on b886 b170 )
    ( on b798 b886 )
    ( on b965 b798 )
    ( on b139 b965 )
    ( on b284 b139 )
    ( on b374 b284 )
    ( on b876 b374 )
    ( on b370 b876 )
    ( on b837 b370 )
    ( on b710 b837 )
    ( on b924 b710 )
    ( clear b924 )
  )
  ( :goal
    ( and
      ( clear b249 )
    )
  )
)
