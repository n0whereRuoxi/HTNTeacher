( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b581 - block
    b333 - block
    b160 - block
    b358 - block
    b225 - block
    b7 - block
    b945 - block
    b886 - block
    b518 - block
    b669 - block
    b263 - block
    b29 - block
    b825 - block
    b521 - block
    b733 - block
    b73 - block
    b46 - block
    b974 - block
    b238 - block
    b39 - block
    b444 - block
    b625 - block
    b361 - block
    b545 - block
    b357 - block
    b453 - block
    b215 - block
    b176 - block
    b609 - block
    b237 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b581 )
    ( on b333 b581 )
    ( on b160 b333 )
    ( on b358 b160 )
    ( on b225 b358 )
    ( on b7 b225 )
    ( on b945 b7 )
    ( on b886 b945 )
    ( on b518 b886 )
    ( on b669 b518 )
    ( on b263 b669 )
    ( on b29 b263 )
    ( on b825 b29 )
    ( on b521 b825 )
    ( on b733 b521 )
    ( on b73 b733 )
    ( on b46 b73 )
    ( on b974 b46 )
    ( on b238 b974 )
    ( on b39 b238 )
    ( on b444 b39 )
    ( on b625 b444 )
    ( on b361 b625 )
    ( on b545 b361 )
    ( on b357 b545 )
    ( on b453 b357 )
    ( on b215 b453 )
    ( on b176 b215 )
    ( on b609 b176 )
    ( on b237 b609 )
    ( clear b237 )
  )
  ( :tasks
    ( Make-29Pile b333 b160 b358 b225 b7 b945 b886 b518 b669 b263 b29 b825 b521 b733 b73 b46 b974 b238 b39 b444 b625 b361 b545 b357 b453 b215 b176 b609 b237 )
  )
)
