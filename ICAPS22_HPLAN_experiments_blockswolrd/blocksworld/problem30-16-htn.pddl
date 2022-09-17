( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b294 - block
    b860 - block
    b929 - block
    b410 - block
    b468 - block
    b569 - block
    b565 - block
    b777 - block
    b220 - block
    b505 - block
    b194 - block
    b366 - block
    b95 - block
    b589 - block
    b803 - block
    b935 - block
    b900 - block
    b673 - block
    b152 - block
    b337 - block
    b749 - block
    b775 - block
    b15 - block
    b335 - block
    b853 - block
    b988 - block
    b303 - block
    b73 - block
    b307 - block
    b906 - block
    b236 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b294 )
    ( on b860 b294 )
    ( on b929 b860 )
    ( on b410 b929 )
    ( on b468 b410 )
    ( on b569 b468 )
    ( on b565 b569 )
    ( on b777 b565 )
    ( on b220 b777 )
    ( on b505 b220 )
    ( on b194 b505 )
    ( on b366 b194 )
    ( on b95 b366 )
    ( on b589 b95 )
    ( on b803 b589 )
    ( on b935 b803 )
    ( on b900 b935 )
    ( on b673 b900 )
    ( on b152 b673 )
    ( on b337 b152 )
    ( on b749 b337 )
    ( on b775 b749 )
    ( on b15 b775 )
    ( on b335 b15 )
    ( on b853 b335 )
    ( on b988 b853 )
    ( on b303 b988 )
    ( on b73 b303 )
    ( on b307 b73 )
    ( on b906 b307 )
    ( on b236 b906 )
    ( clear b236 )
  )
  ( :tasks
    ( Make-30Pile b860 b929 b410 b468 b569 b565 b777 b220 b505 b194 b366 b95 b589 b803 b935 b900 b673 b152 b337 b749 b775 b15 b335 b853 b988 b303 b73 b307 b906 b236 )
  )
)
