( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b978 - block
    b270 - block
    b936 - block
    b177 - block
    b392 - block
    b629 - block
    b519 - block
    b970 - block
    b623 - block
    b47 - block
    b284 - block
    b942 - block
    b691 - block
    b143 - block
    b633 - block
    b971 - block
    b991 - block
    b820 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b978 )
    ( on b270 b978 )
    ( on b936 b270 )
    ( on b177 b936 )
    ( on b392 b177 )
    ( on b629 b392 )
    ( on b519 b629 )
    ( on b970 b519 )
    ( on b623 b970 )
    ( on b47 b623 )
    ( on b284 b47 )
    ( on b942 b284 )
    ( on b691 b942 )
    ( on b143 b691 )
    ( on b633 b143 )
    ( on b971 b633 )
    ( on b991 b971 )
    ( on b820 b991 )
    ( clear b820 )
  )
  ( :tasks
    ( Make-17Pile b270 b936 b177 b392 b629 b519 b970 b623 b47 b284 b942 b691 b143 b633 b971 b991 b820 )
  )
)
