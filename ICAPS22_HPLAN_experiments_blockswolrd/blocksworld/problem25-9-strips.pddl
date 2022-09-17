( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
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
  ( :goal
    ( and
      ( clear b971 )
    )
  )
)
