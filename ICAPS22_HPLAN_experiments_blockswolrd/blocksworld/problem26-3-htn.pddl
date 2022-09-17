( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b697 - block
    b845 - block
    b67 - block
    b632 - block
    b622 - block
    b683 - block
    b318 - block
    b473 - block
    b971 - block
    b825 - block
    b959 - block
    b957 - block
    b455 - block
    b502 - block
    b56 - block
    b298 - block
    b637 - block
    b241 - block
    b790 - block
    b307 - block
    b89 - block
    b882 - block
    b577 - block
    b805 - block
    b64 - block
    b554 - block
    b411 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b697 )
    ( on b845 b697 )
    ( on b67 b845 )
    ( on b632 b67 )
    ( on b622 b632 )
    ( on b683 b622 )
    ( on b318 b683 )
    ( on b473 b318 )
    ( on b971 b473 )
    ( on b825 b971 )
    ( on b959 b825 )
    ( on b957 b959 )
    ( on b455 b957 )
    ( on b502 b455 )
    ( on b56 b502 )
    ( on b298 b56 )
    ( on b637 b298 )
    ( on b241 b637 )
    ( on b790 b241 )
    ( on b307 b790 )
    ( on b89 b307 )
    ( on b882 b89 )
    ( on b577 b882 )
    ( on b805 b577 )
    ( on b64 b805 )
    ( on b554 b64 )
    ( on b411 b554 )
    ( clear b411 )
  )
  ( :tasks
    ( Make-26Pile b845 b67 b632 b622 b683 b318 b473 b971 b825 b959 b957 b455 b502 b56 b298 b637 b241 b790 b307 b89 b882 b577 b805 b64 b554 b411 )
  )
)
