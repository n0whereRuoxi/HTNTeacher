( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b725 - block
    b214 - block
    b383 - block
    b846 - block
    b122 - block
    b296 - block
    b315 - block
    b153 - block
    b72 - block
    b344 - block
    b900 - block
    b473 - block
    b103 - block
    b760 - block
    b571 - block
    b420 - block
    b86 - block
    b533 - block
    b257 - block
    b82 - block
    b336 - block
    b462 - block
    b973 - block
    b63 - block
    b332 - block
    b406 - block
    b376 - block
    b934 - block
    b70 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b725 )
    ( on b214 b725 )
    ( on b383 b214 )
    ( on b846 b383 )
    ( on b122 b846 )
    ( on b296 b122 )
    ( on b315 b296 )
    ( on b153 b315 )
    ( on b72 b153 )
    ( on b344 b72 )
    ( on b900 b344 )
    ( on b473 b900 )
    ( on b103 b473 )
    ( on b760 b103 )
    ( on b571 b760 )
    ( on b420 b571 )
    ( on b86 b420 )
    ( on b533 b86 )
    ( on b257 b533 )
    ( on b82 b257 )
    ( on b336 b82 )
    ( on b462 b336 )
    ( on b973 b462 )
    ( on b63 b973 )
    ( on b332 b63 )
    ( on b406 b332 )
    ( on b376 b406 )
    ( on b934 b376 )
    ( on b70 b934 )
    ( clear b70 )
  )
  ( :tasks
    ( Make-28Pile b214 b383 b846 b122 b296 b315 b153 b72 b344 b900 b473 b103 b760 b571 b420 b86 b533 b257 b82 b336 b462 b973 b63 b332 b406 b376 b934 b70 )
  )
)
