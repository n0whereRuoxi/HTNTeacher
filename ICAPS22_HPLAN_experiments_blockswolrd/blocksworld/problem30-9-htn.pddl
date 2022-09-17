( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b478 - block
    b794 - block
    b140 - block
    b889 - block
    b246 - block
    b574 - block
    b497 - block
    b496 - block
    b888 - block
    b81 - block
    b740 - block
    b338 - block
    b894 - block
    b207 - block
    b400 - block
    b228 - block
    b929 - block
    b367 - block
    b779 - block
    b970 - block
    b344 - block
    b411 - block
    b243 - block
    b95 - block
    b435 - block
    b441 - block
    b47 - block
    b570 - block
    b14 - block
    b392 - block
    b75 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b478 )
    ( on b794 b478 )
    ( on b140 b794 )
    ( on b889 b140 )
    ( on b246 b889 )
    ( on b574 b246 )
    ( on b497 b574 )
    ( on b496 b497 )
    ( on b888 b496 )
    ( on b81 b888 )
    ( on b740 b81 )
    ( on b338 b740 )
    ( on b894 b338 )
    ( on b207 b894 )
    ( on b400 b207 )
    ( on b228 b400 )
    ( on b929 b228 )
    ( on b367 b929 )
    ( on b779 b367 )
    ( on b970 b779 )
    ( on b344 b970 )
    ( on b411 b344 )
    ( on b243 b411 )
    ( on b95 b243 )
    ( on b435 b95 )
    ( on b441 b435 )
    ( on b47 b441 )
    ( on b570 b47 )
    ( on b14 b570 )
    ( on b392 b14 )
    ( on b75 b392 )
    ( clear b75 )
  )
  ( :tasks
    ( Make-30Pile b794 b140 b889 b246 b574 b497 b496 b888 b81 b740 b338 b894 b207 b400 b228 b929 b367 b779 b970 b344 b411 b243 b95 b435 b441 b47 b570 b14 b392 b75 )
  )
)
