( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b642 - block
    b106 - block
    b874 - block
    b956 - block
    b122 - block
    b803 - block
    b724 - block
    b534 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b642 )
    ( on b106 b642 )
    ( on b874 b106 )
    ( on b956 b874 )
    ( on b122 b956 )
    ( on b803 b122 )
    ( on b724 b803 )
    ( on b534 b724 )
    ( clear b534 )
  )
  ( :goal
    ( and
      ( clear b642 )
    )
  )
)
