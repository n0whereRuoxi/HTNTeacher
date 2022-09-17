( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b125 - block
    b306 - block
    b571 - block
    b895 - block
    b471 - block
    b357 - block
    b573 - block
    b181 - block
    b722 - block
    b682 - block
    b366 - block
    b876 - block
    b715 - block
    b110 - block
    b212 - block
    b874 - block
    b535 - block
    b937 - block
    b32 - block
    b342 - block
    b70 - block
    b822 - block
    b337 - block
    b743 - block
    b82 - block
    b999 - block
    b905 - block
    b450 - block
    b271 - block
    b670 - block
    b413 - block
    b137 - block
    b555 - block
    b626 - block
    b408 - block
    b501 - block
    b51 - block
    b100 - block
    b721 - block
    b924 - block
    b861 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b125 )
    ( on b306 b125 )
    ( on b571 b306 )
    ( on b895 b571 )
    ( on b471 b895 )
    ( on b357 b471 )
    ( on b573 b357 )
    ( on b181 b573 )
    ( on b722 b181 )
    ( on b682 b722 )
    ( on b366 b682 )
    ( on b876 b366 )
    ( on b715 b876 )
    ( on b110 b715 )
    ( on b212 b110 )
    ( on b874 b212 )
    ( on b535 b874 )
    ( on b937 b535 )
    ( on b32 b937 )
    ( on b342 b32 )
    ( on b70 b342 )
    ( on b822 b70 )
    ( on b337 b822 )
    ( on b743 b337 )
    ( on b82 b743 )
    ( on b999 b82 )
    ( on b905 b999 )
    ( on b450 b905 )
    ( on b271 b450 )
    ( on b670 b271 )
    ( on b413 b670 )
    ( on b137 b413 )
    ( on b555 b137 )
    ( on b626 b555 )
    ( on b408 b626 )
    ( on b501 b408 )
    ( on b51 b501 )
    ( on b100 b51 )
    ( on b721 b100 )
    ( on b924 b721 )
    ( on b861 b924 )
    ( clear b861 )
  )
  ( :goal
    ( and
      ( clear b125 )
    )
  )
)
