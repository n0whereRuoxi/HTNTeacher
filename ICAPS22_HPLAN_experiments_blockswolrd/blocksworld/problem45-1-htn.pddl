( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b981 - block
    b987 - block
    b860 - block
    b700 - block
    b465 - block
    b835 - block
    b779 - block
    b283 - block
    b359 - block
    b781 - block
    b737 - block
    b677 - block
    b505 - block
    b589 - block
    b45 - block
    b67 - block
    b34 - block
    b20 - block
    b801 - block
    b372 - block
    b73 - block
    b334 - block
    b415 - block
    b91 - block
    b538 - block
    b519 - block
    b640 - block
    b621 - block
    b579 - block
    b984 - block
    b237 - block
    b482 - block
    b967 - block
    b231 - block
    b373 - block
    b913 - block
    b549 - block
    b312 - block
    b671 - block
    b41 - block
    b963 - block
    b521 - block
    b333 - block
    b153 - block
    b699 - block
    b970 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b981 )
    ( on b987 b981 )
    ( on b860 b987 )
    ( on b700 b860 )
    ( on b465 b700 )
    ( on b835 b465 )
    ( on b779 b835 )
    ( on b283 b779 )
    ( on b359 b283 )
    ( on b781 b359 )
    ( on b737 b781 )
    ( on b677 b737 )
    ( on b505 b677 )
    ( on b589 b505 )
    ( on b45 b589 )
    ( on b67 b45 )
    ( on b34 b67 )
    ( on b20 b34 )
    ( on b801 b20 )
    ( on b372 b801 )
    ( on b73 b372 )
    ( on b334 b73 )
    ( on b415 b334 )
    ( on b91 b415 )
    ( on b538 b91 )
    ( on b519 b538 )
    ( on b640 b519 )
    ( on b621 b640 )
    ( on b579 b621 )
    ( on b984 b579 )
    ( on b237 b984 )
    ( on b482 b237 )
    ( on b967 b482 )
    ( on b231 b967 )
    ( on b373 b231 )
    ( on b913 b373 )
    ( on b549 b913 )
    ( on b312 b549 )
    ( on b671 b312 )
    ( on b41 b671 )
    ( on b963 b41 )
    ( on b521 b963 )
    ( on b333 b521 )
    ( on b153 b333 )
    ( on b699 b153 )
    ( on b970 b699 )
    ( clear b970 )
  )
  ( :tasks
    ( Make-45Pile b987 b860 b700 b465 b835 b779 b283 b359 b781 b737 b677 b505 b589 b45 b67 b34 b20 b801 b372 b73 b334 b415 b91 b538 b519 b640 b621 b579 b984 b237 b482 b967 b231 b373 b913 b549 b312 b671 b41 b963 b521 b333 b153 b699 b970 )
  )
)
