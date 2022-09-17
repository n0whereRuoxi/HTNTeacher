( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b166 - block
    b60 - block
    b526 - block
    b872 - block
    b482 - block
    b78 - block
    b97 - block
    b411 - block
    b716 - block
    b107 - block
    b790 - block
    b860 - block
    b789 - block
    b985 - block
    b555 - block
    b38 - block
    b935 - block
    b715 - block
    b233 - block
    b806 - block
    b347 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b166 )
    ( on b60 b166 )
    ( on b526 b60 )
    ( on b872 b526 )
    ( on b482 b872 )
    ( on b78 b482 )
    ( on b97 b78 )
    ( on b411 b97 )
    ( on b716 b411 )
    ( on b107 b716 )
    ( on b790 b107 )
    ( on b860 b790 )
    ( on b789 b860 )
    ( on b985 b789 )
    ( on b555 b985 )
    ( on b38 b555 )
    ( on b935 b38 )
    ( on b715 b935 )
    ( on b233 b715 )
    ( on b806 b233 )
    ( on b347 b806 )
    ( clear b347 )
  )
  ( :goal
    ( and
      ( clear b166 )
    )
  )
)
