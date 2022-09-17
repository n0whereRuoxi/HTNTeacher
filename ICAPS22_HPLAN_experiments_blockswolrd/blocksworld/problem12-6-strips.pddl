( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b83 - block
    b132 - block
    b817 - block
    b393 - block
    b753 - block
    b674 - block
    b743 - block
    b41 - block
    b147 - block
    b190 - block
    b790 - block
    b314 - block
    b905 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b83 )
    ( on b132 b83 )
    ( on b817 b132 )
    ( on b393 b817 )
    ( on b753 b393 )
    ( on b674 b753 )
    ( on b743 b674 )
    ( on b41 b743 )
    ( on b147 b41 )
    ( on b190 b147 )
    ( on b790 b190 )
    ( on b314 b790 )
    ( on b905 b314 )
    ( clear b905 )
  )
  ( :goal
    ( and
      ( clear b83 )
    )
  )
)
