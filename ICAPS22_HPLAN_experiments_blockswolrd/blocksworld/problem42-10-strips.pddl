( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b405 - block
    b745 - block
    b477 - block
    b536 - block
    b937 - block
    b630 - block
    b946 - block
    b397 - block
    b137 - block
    b234 - block
    b792 - block
    b406 - block
    b464 - block
    b100 - block
    b125 - block
    b922 - block
    b304 - block
    b918 - block
    b301 - block
    b465 - block
    b566 - block
    b208 - block
    b201 - block
    b794 - block
    b587 - block
    b675 - block
    b608 - block
    b633 - block
    b611 - block
    b428 - block
    b357 - block
    b82 - block
    b70 - block
    b890 - block
    b594 - block
    b73 - block
    b443 - block
    b268 - block
    b5 - block
    b159 - block
    b563 - block
    b553 - block
    b599 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b405 )
    ( on b745 b405 )
    ( on b477 b745 )
    ( on b536 b477 )
    ( on b937 b536 )
    ( on b630 b937 )
    ( on b946 b630 )
    ( on b397 b946 )
    ( on b137 b397 )
    ( on b234 b137 )
    ( on b792 b234 )
    ( on b406 b792 )
    ( on b464 b406 )
    ( on b100 b464 )
    ( on b125 b100 )
    ( on b922 b125 )
    ( on b304 b922 )
    ( on b918 b304 )
    ( on b301 b918 )
    ( on b465 b301 )
    ( on b566 b465 )
    ( on b208 b566 )
    ( on b201 b208 )
    ( on b794 b201 )
    ( on b587 b794 )
    ( on b675 b587 )
    ( on b608 b675 )
    ( on b633 b608 )
    ( on b611 b633 )
    ( on b428 b611 )
    ( on b357 b428 )
    ( on b82 b357 )
    ( on b70 b82 )
    ( on b890 b70 )
    ( on b594 b890 )
    ( on b73 b594 )
    ( on b443 b73 )
    ( on b268 b443 )
    ( on b5 b268 )
    ( on b159 b5 )
    ( on b563 b159 )
    ( on b553 b563 )
    ( on b599 b553 )
    ( clear b599 )
  )
  ( :goal
    ( and
      ( clear b405 )
    )
  )
)
