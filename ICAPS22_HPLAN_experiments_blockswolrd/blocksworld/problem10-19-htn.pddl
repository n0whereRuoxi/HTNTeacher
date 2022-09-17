( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b856 - block
    b182 - block
    b482 - block
    b880 - block
    b406 - block
    b19 - block
    b854 - block
    b69 - block
    b659 - block
    b560 - block
    b891 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b856 )
    ( on b182 b856 )
    ( on b482 b182 )
    ( on b880 b482 )
    ( on b406 b880 )
    ( on b19 b406 )
    ( on b854 b19 )
    ( on b69 b854 )
    ( on b659 b69 )
    ( on b560 b659 )
    ( on b891 b560 )
    ( clear b891 )
  )
  ( :tasks
    ( Make-10Pile b182 b482 b880 b406 b19 b854 b69 b659 b560 b891 )
  )
)
