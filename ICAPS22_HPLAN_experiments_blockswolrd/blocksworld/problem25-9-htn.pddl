( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b971 - block
    b571 - block
    b65 - block
    b787 - block
    b957 - block
    b448 - block
    b472 - block
    b628 - block
    b394 - block
    b25 - block
    b88 - block
    b970 - block
    b405 - block
    b698 - block
    b923 - block
    b956 - block
    b673 - block
    b204 - block
    b7 - block
    b270 - block
    b417 - block
    b366 - block
    b803 - block
    b361 - block
    b246 - block
    b407 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b971 )
    ( on b571 b971 )
    ( on b65 b571 )
    ( on b787 b65 )
    ( on b957 b787 )
    ( on b448 b957 )
    ( on b472 b448 )
    ( on b628 b472 )
    ( on b394 b628 )
    ( on b25 b394 )
    ( on b88 b25 )
    ( on b970 b88 )
    ( on b405 b970 )
    ( on b698 b405 )
    ( on b923 b698 )
    ( on b956 b923 )
    ( on b673 b956 )
    ( on b204 b673 )
    ( on b7 b204 )
    ( on b270 b7 )
    ( on b417 b270 )
    ( on b366 b417 )
    ( on b803 b366 )
    ( on b361 b803 )
    ( on b246 b361 )
    ( on b407 b246 )
    ( clear b407 )
  )
  ( :tasks
    ( Make-25Pile b571 b65 b787 b957 b448 b472 b628 b394 b25 b88 b970 b405 b698 b923 b956 b673 b204 b7 b270 b417 b366 b803 b361 b246 b407 )
  )
)
