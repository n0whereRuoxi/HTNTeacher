( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b699 - block
    b588 - block
    b532 - block
    b556 - block
    b899 - block
    b940 - block
    b87 - block
    b579 - block
    b620 - block
    b223 - block
    b9 - block
    b145 - block
    b970 - block
    b685 - block
    b712 - block
    b814 - block
    b498 - block
    b179 - block
    b241 - block
    b436 - block
    b1 - block
    b602 - block
    b43 - block
    b545 - block
    b169 - block
    b278 - block
    b376 - block
    b19 - block
    b320 - block
    b575 - block
    b618 - block
    b862 - block
    b522 - block
    b3 - block
    b335 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b699 )
    ( on b588 b699 )
    ( on b532 b588 )
    ( on b556 b532 )
    ( on b899 b556 )
    ( on b940 b899 )
    ( on b87 b940 )
    ( on b579 b87 )
    ( on b620 b579 )
    ( on b223 b620 )
    ( on b9 b223 )
    ( on b145 b9 )
    ( on b970 b145 )
    ( on b685 b970 )
    ( on b712 b685 )
    ( on b814 b712 )
    ( on b498 b814 )
    ( on b179 b498 )
    ( on b241 b179 )
    ( on b436 b241 )
    ( on b1 b436 )
    ( on b602 b1 )
    ( on b43 b602 )
    ( on b545 b43 )
    ( on b169 b545 )
    ( on b278 b169 )
    ( on b376 b278 )
    ( on b19 b376 )
    ( on b320 b19 )
    ( on b575 b320 )
    ( on b618 b575 )
    ( on b862 b618 )
    ( on b522 b862 )
    ( on b3 b522 )
    ( on b335 b3 )
    ( clear b335 )
  )
  ( :goal
    ( and
      ( clear b699 )
    )
  )
)
