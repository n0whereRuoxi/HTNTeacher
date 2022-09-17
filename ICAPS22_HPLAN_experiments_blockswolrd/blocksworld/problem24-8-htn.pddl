( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b127 - block
    b482 - block
    b519 - block
    b498 - block
    b905 - block
    b515 - block
    b801 - block
    b501 - block
    b964 - block
    b722 - block
    b162 - block
    b989 - block
    b860 - block
    b526 - block
    b596 - block
    b853 - block
    b41 - block
    b168 - block
    b75 - block
    b723 - block
    b307 - block
    b790 - block
    b972 - block
    b37 - block
    b892 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b127 )
    ( on b482 b127 )
    ( on b519 b482 )
    ( on b498 b519 )
    ( on b905 b498 )
    ( on b515 b905 )
    ( on b801 b515 )
    ( on b501 b801 )
    ( on b964 b501 )
    ( on b722 b964 )
    ( on b162 b722 )
    ( on b989 b162 )
    ( on b860 b989 )
    ( on b526 b860 )
    ( on b596 b526 )
    ( on b853 b596 )
    ( on b41 b853 )
    ( on b168 b41 )
    ( on b75 b168 )
    ( on b723 b75 )
    ( on b307 b723 )
    ( on b790 b307 )
    ( on b972 b790 )
    ( on b37 b972 )
    ( on b892 b37 )
    ( clear b892 )
  )
  ( :tasks
    ( Make-24Pile b482 b519 b498 b905 b515 b801 b501 b964 b722 b162 b989 b860 b526 b596 b853 b41 b168 b75 b723 b307 b790 b972 b37 b892 )
  )
)
