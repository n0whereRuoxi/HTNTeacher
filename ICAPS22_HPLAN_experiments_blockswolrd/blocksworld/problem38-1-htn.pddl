( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b526 - block
    b989 - block
    b158 - block
    b306 - block
    b804 - block
    b550 - block
    b551 - block
    b276 - block
    b428 - block
    b305 - block
    b234 - block
    b113 - block
    b571 - block
    b170 - block
    b619 - block
    b853 - block
    b5 - block
    b495 - block
    b400 - block
    b612 - block
    b333 - block
    b896 - block
    b555 - block
    b822 - block
    b197 - block
    b430 - block
    b861 - block
    b337 - block
    b216 - block
    b38 - block
    b702 - block
    b506 - block
    b382 - block
    b408 - block
    b577 - block
    b693 - block
    b671 - block
    b283 - block
    b247 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b526 )
    ( on b989 b526 )
    ( on b158 b989 )
    ( on b306 b158 )
    ( on b804 b306 )
    ( on b550 b804 )
    ( on b551 b550 )
    ( on b276 b551 )
    ( on b428 b276 )
    ( on b305 b428 )
    ( on b234 b305 )
    ( on b113 b234 )
    ( on b571 b113 )
    ( on b170 b571 )
    ( on b619 b170 )
    ( on b853 b619 )
    ( on b5 b853 )
    ( on b495 b5 )
    ( on b400 b495 )
    ( on b612 b400 )
    ( on b333 b612 )
    ( on b896 b333 )
    ( on b555 b896 )
    ( on b822 b555 )
    ( on b197 b822 )
    ( on b430 b197 )
    ( on b861 b430 )
    ( on b337 b861 )
    ( on b216 b337 )
    ( on b38 b216 )
    ( on b702 b38 )
    ( on b506 b702 )
    ( on b382 b506 )
    ( on b408 b382 )
    ( on b577 b408 )
    ( on b693 b577 )
    ( on b671 b693 )
    ( on b283 b671 )
    ( on b247 b283 )
    ( clear b247 )
  )
  ( :tasks
    ( Make-38Pile b989 b158 b306 b804 b550 b551 b276 b428 b305 b234 b113 b571 b170 b619 b853 b5 b495 b400 b612 b333 b896 b555 b822 b197 b430 b861 b337 b216 b38 b702 b506 b382 b408 b577 b693 b671 b283 b247 )
  )
)
