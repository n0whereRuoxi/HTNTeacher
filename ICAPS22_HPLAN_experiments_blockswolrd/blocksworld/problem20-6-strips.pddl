( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b143 - block
    b806 - block
    b958 - block
    b297 - block
    b177 - block
    b29 - block
    b654 - block
    b956 - block
    b417 - block
    b394 - block
    b648 - block
    b88 - block
    b409 - block
    b948 - block
    b659 - block
    b793 - block
    b469 - block
    b431 - block
    b530 - block
    b988 - block
    b213 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b143 )
    ( on b806 b143 )
    ( on b958 b806 )
    ( on b297 b958 )
    ( on b177 b297 )
    ( on b29 b177 )
    ( on b654 b29 )
    ( on b956 b654 )
    ( on b417 b956 )
    ( on b394 b417 )
    ( on b648 b394 )
    ( on b88 b648 )
    ( on b409 b88 )
    ( on b948 b409 )
    ( on b659 b948 )
    ( on b793 b659 )
    ( on b469 b793 )
    ( on b431 b469 )
    ( on b530 b431 )
    ( on b988 b530 )
    ( on b213 b988 )
    ( clear b213 )
  )
  ( :goal
    ( and
      ( clear b143 )
    )
  )
)
