( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b330 - block
    b374 - block
    b86 - block
    b602 - block
    b585 - block
    b848 - block
    b82 - block
    b182 - block
    b471 - block
    b383 - block
    b479 - block
    b51 - block
    b648 - block
    b118 - block
    b914 - block
    b464 - block
    b884 - block
    b789 - block
    b534 - block
    b825 - block
    b468 - block
    b831 - block
    b577 - block
    b301 - block
    b456 - block
    b205 - block
    b551 - block
    b356 - block
    b208 - block
    b251 - block
    b106 - block
    b530 - block
    b819 - block
    b75 - block
    b888 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b330 )
    ( on b374 b330 )
    ( on b86 b374 )
    ( on b602 b86 )
    ( on b585 b602 )
    ( on b848 b585 )
    ( on b82 b848 )
    ( on b182 b82 )
    ( on b471 b182 )
    ( on b383 b471 )
    ( on b479 b383 )
    ( on b51 b479 )
    ( on b648 b51 )
    ( on b118 b648 )
    ( on b914 b118 )
    ( on b464 b914 )
    ( on b884 b464 )
    ( on b789 b884 )
    ( on b534 b789 )
    ( on b825 b534 )
    ( on b468 b825 )
    ( on b831 b468 )
    ( on b577 b831 )
    ( on b301 b577 )
    ( on b456 b301 )
    ( on b205 b456 )
    ( on b551 b205 )
    ( on b356 b551 )
    ( on b208 b356 )
    ( on b251 b208 )
    ( on b106 b251 )
    ( on b530 b106 )
    ( on b819 b530 )
    ( on b75 b819 )
    ( on b888 b75 )
    ( clear b888 )
  )
  ( :tasks
    ( Make-34Pile b374 b86 b602 b585 b848 b82 b182 b471 b383 b479 b51 b648 b118 b914 b464 b884 b789 b534 b825 b468 b831 b577 b301 b456 b205 b551 b356 b208 b251 b106 b530 b819 b75 b888 )
  )
)
