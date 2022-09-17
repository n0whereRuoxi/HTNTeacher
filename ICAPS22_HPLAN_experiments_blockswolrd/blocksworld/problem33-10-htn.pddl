( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b908 - block
    b329 - block
    b340 - block
    b874 - block
    b131 - block
    b710 - block
    b534 - block
    b870 - block
    b472 - block
    b273 - block
    b834 - block
    b234 - block
    b822 - block
    b909 - block
    b91 - block
    b190 - block
    b124 - block
    b766 - block
    b580 - block
    b19 - block
    b355 - block
    b930 - block
    b110 - block
    b207 - block
    b552 - block
    b756 - block
    b835 - block
    b320 - block
    b761 - block
    b517 - block
    b186 - block
    b389 - block
    b331 - block
    b778 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b908 )
    ( on b329 b908 )
    ( on b340 b329 )
    ( on b874 b340 )
    ( on b131 b874 )
    ( on b710 b131 )
    ( on b534 b710 )
    ( on b870 b534 )
    ( on b472 b870 )
    ( on b273 b472 )
    ( on b834 b273 )
    ( on b234 b834 )
    ( on b822 b234 )
    ( on b909 b822 )
    ( on b91 b909 )
    ( on b190 b91 )
    ( on b124 b190 )
    ( on b766 b124 )
    ( on b580 b766 )
    ( on b19 b580 )
    ( on b355 b19 )
    ( on b930 b355 )
    ( on b110 b930 )
    ( on b207 b110 )
    ( on b552 b207 )
    ( on b756 b552 )
    ( on b835 b756 )
    ( on b320 b835 )
    ( on b761 b320 )
    ( on b517 b761 )
    ( on b186 b517 )
    ( on b389 b186 )
    ( on b331 b389 )
    ( on b778 b331 )
    ( clear b778 )
  )
  ( :tasks
    ( Make-33Pile b329 b340 b874 b131 b710 b534 b870 b472 b273 b834 b234 b822 b909 b91 b190 b124 b766 b580 b19 b355 b930 b110 b207 b552 b756 b835 b320 b761 b517 b186 b389 b331 b778 )
  )
)
