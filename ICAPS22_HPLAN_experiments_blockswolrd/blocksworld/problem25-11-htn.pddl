( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b308 - block
    b93 - block
    b828 - block
    b897 - block
    b522 - block
    b987 - block
    b35 - block
    b362 - block
    b361 - block
    b248 - block
    b688 - block
    b337 - block
    b665 - block
    b619 - block
    b901 - block
    b351 - block
    b102 - block
    b867 - block
    b251 - block
    b275 - block
    b636 - block
    b740 - block
    b149 - block
    b31 - block
    b561 - block
    b205 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b308 )
    ( on b93 b308 )
    ( on b828 b93 )
    ( on b897 b828 )
    ( on b522 b897 )
    ( on b987 b522 )
    ( on b35 b987 )
    ( on b362 b35 )
    ( on b361 b362 )
    ( on b248 b361 )
    ( on b688 b248 )
    ( on b337 b688 )
    ( on b665 b337 )
    ( on b619 b665 )
    ( on b901 b619 )
    ( on b351 b901 )
    ( on b102 b351 )
    ( on b867 b102 )
    ( on b251 b867 )
    ( on b275 b251 )
    ( on b636 b275 )
    ( on b740 b636 )
    ( on b149 b740 )
    ( on b31 b149 )
    ( on b561 b31 )
    ( on b205 b561 )
    ( clear b205 )
  )
  ( :tasks
    ( Make-25Pile b93 b828 b897 b522 b987 b35 b362 b361 b248 b688 b337 b665 b619 b901 b351 b102 b867 b251 b275 b636 b740 b149 b31 b561 b205 )
  )
)
