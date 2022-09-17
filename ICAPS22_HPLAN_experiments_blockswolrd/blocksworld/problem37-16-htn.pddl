( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b439 - block
    b736 - block
    b247 - block
    b217 - block
    b236 - block
    b201 - block
    b481 - block
    b615 - block
    b603 - block
    b560 - block
    b948 - block
    b801 - block
    b360 - block
    b447 - block
    b839 - block
    b969 - block
    b649 - block
    b6 - block
    b600 - block
    b506 - block
    b842 - block
    b664 - block
    b426 - block
    b327 - block
    b421 - block
    b354 - block
    b468 - block
    b341 - block
    b802 - block
    b473 - block
    b368 - block
    b992 - block
    b874 - block
    b895 - block
    b215 - block
    b773 - block
    b423 - block
    b824 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b439 )
    ( on b736 b439 )
    ( on b247 b736 )
    ( on b217 b247 )
    ( on b236 b217 )
    ( on b201 b236 )
    ( on b481 b201 )
    ( on b615 b481 )
    ( on b603 b615 )
    ( on b560 b603 )
    ( on b948 b560 )
    ( on b801 b948 )
    ( on b360 b801 )
    ( on b447 b360 )
    ( on b839 b447 )
    ( on b969 b839 )
    ( on b649 b969 )
    ( on b6 b649 )
    ( on b600 b6 )
    ( on b506 b600 )
    ( on b842 b506 )
    ( on b664 b842 )
    ( on b426 b664 )
    ( on b327 b426 )
    ( on b421 b327 )
    ( on b354 b421 )
    ( on b468 b354 )
    ( on b341 b468 )
    ( on b802 b341 )
    ( on b473 b802 )
    ( on b368 b473 )
    ( on b992 b368 )
    ( on b874 b992 )
    ( on b895 b874 )
    ( on b215 b895 )
    ( on b773 b215 )
    ( on b423 b773 )
    ( on b824 b423 )
    ( clear b824 )
  )
  ( :tasks
    ( Make-37Pile b736 b247 b217 b236 b201 b481 b615 b603 b560 b948 b801 b360 b447 b839 b969 b649 b6 b600 b506 b842 b664 b426 b327 b421 b354 b468 b341 b802 b473 b368 b992 b874 b895 b215 b773 b423 b824 )
  )
)
