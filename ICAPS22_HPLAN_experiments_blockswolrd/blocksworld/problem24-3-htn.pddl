( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b471 - block
    b127 - block
    b430 - block
    b393 - block
    b600 - block
    b318 - block
    b48 - block
    b97 - block
    b593 - block
    b24 - block
    b21 - block
    b363 - block
    b312 - block
    b441 - block
    b407 - block
    b264 - block
    b490 - block
    b177 - block
    b377 - block
    b648 - block
    b32 - block
    b547 - block
    b835 - block
    b730 - block
    b399 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b471 )
    ( on b127 b471 )
    ( on b430 b127 )
    ( on b393 b430 )
    ( on b600 b393 )
    ( on b318 b600 )
    ( on b48 b318 )
    ( on b97 b48 )
    ( on b593 b97 )
    ( on b24 b593 )
    ( on b21 b24 )
    ( on b363 b21 )
    ( on b312 b363 )
    ( on b441 b312 )
    ( on b407 b441 )
    ( on b264 b407 )
    ( on b490 b264 )
    ( on b177 b490 )
    ( on b377 b177 )
    ( on b648 b377 )
    ( on b32 b648 )
    ( on b547 b32 )
    ( on b835 b547 )
    ( on b730 b835 )
    ( on b399 b730 )
    ( clear b399 )
  )
  ( :tasks
    ( Make-24Pile b127 b430 b393 b600 b318 b48 b97 b593 b24 b21 b363 b312 b441 b407 b264 b490 b177 b377 b648 b32 b547 b835 b730 b399 )
  )
)
